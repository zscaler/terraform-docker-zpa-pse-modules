################################################################################
# Generate a unique random string for resource name assignment and key pair
################################################################################
resource "random_string" "suffix" {
  length  = 8
  upper   = false
  special = false
}


################################################################################
# 1. Create ZPA Service Edge Group
################################################################################
module "zpa_service_edge_group" {
  count                                        = var.byo_provisioning_key == true ? 0 : 1 # Only use this module if a new provisioning key is needed
  source                                       = "../../modules/terraform-zpa-service-edge-group"
  service_edge_group_name                     = "${var.service_edge_group_name}-${var.name_prefix}"
  service_edge_group_description              = "${var.service_edge_group_description}-${var.name_prefix}"
  service_edge_group_enabled                  = var.service_edge_group_enabled
  service_edge_group_country_code             = var.service_edge_group_country_code
  service_edge_group_latitude                 = var.service_edge_group_latitude
  service_edge_group_longitude                = var.service_edge_group_longitude
  service_edge_group_location                 = var.service_edge_group_location
  service_edge_group_upgrade_day              = var.service_edge_group_upgrade_day
  service_edge_group_upgrade_time_in_secs     = var.service_edge_group_upgrade_time_in_secs
  service_edge_group_override_version_profile = var.service_edge_group_override_version_profile
  service_edge_group_version_profile_id       = var.service_edge_group_version_profile_id
}


################################################################################
# 2. Create ZPA Provisioning Key (or reference existing if byo set)
################################################################################
module "zpa_provisioning_key" {
  source                            = "../../modules/terraform-zpa-provisioning-key"
  enrollment_cert                   = var.enrollment_cert
  provisioning_key_name             = "${var.provisioning_key_name}-${var.name_prefix}-zpa"
  provisioning_key_enabled          = var.provisioning_key_enabled
  provisioning_key_association_type = var.provisioning_key_association_type
  provisioning_key_max_usage        = var.provisioning_key_max_usage
  service_edge_group_id            = try(module.zpa_service_edge_group[0].service_edge_group_id, "")
  byo_provisioning_key              = var.byo_provisioning_key
  byo_provisioning_key_name         = var.byo_provisioning_key_name
}

locals {
  provision_key = {
    ZPA_PROVISION_KEY = module.zpa_provisioning_key.provisioning_key
  }
}

module "zpa_connector_docker" {
  source            = "../../modules/terraform-zpa-connector-docker-container"
  pse_count          = var.pse_count
  image             = var.image
  container_name    = "${var.name_prefix}-ac-${random_string.suffix.result}"
  hostname          = var.hostname
  restart_policy    = var.restart_policy
  working_dir       = var.working_dir
  privileged        = var.privileged
  network_mode      = var.network_mode
  dns               = var.dns
  entrypoint        = var.entrypoint
  command           = var.command
  capabilities      = var.capabilities
  environment       = local.provision_key
  docker_networks   = var.docker_networks
  ports             = var.ports
  named_volumes     = var.named_volumes
  host_paths        = var.host_paths
  devices           = var.devices
  networks_advanced = var.networks_advanced
}

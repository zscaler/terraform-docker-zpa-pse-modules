################################################################################
# Create ZPA Service Edge Group
################################################################################
# Create App Service Edge
resource "zpa_service_edge_group" "service_edge_group" {
  name                     = var.service_edge_group_name
  description              = var.service_edge_group_description
  enabled                  = var.service_edge_group_enabled
  city_country             = var.service_edge_group_city_country
  country_code             = var.service_edge_group_country_code
  latitude                 = var.service_edge_group_latitude
  longitude                = var.service_edge_group_longitude
  location                 = var.service_edge_group_location
  upgrade_day              = var.service_edge_group_upgrade_day
  is_public                = var.service_edge_group_is_public
  upgrade_time_in_secs     = var.service_edge_group_upgrade_time_in_secs
  override_version_profile = var.service_edge_group_override_version_profile
  version_profile_id       = var.service_edge_group_version_profile_id
  grace_distance_enabled  = var.service_edge_group_grace_distance_enabled
  grace_distance_value    = var.service_edge_group_grace_distance_value
  grace_distance_value_unit = var.service_edge_group_grace_distance_value_unit
}

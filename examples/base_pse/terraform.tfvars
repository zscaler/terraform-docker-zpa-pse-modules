## This is only a sample terraform.tfvars file.
## Uncomment and change the below variables according to your specific environment

#####################################################################################################################
##### Variables 5-13 are populated automically if terraform is ran via ZSAC bash script.  #####
##### Modifying the variables in this file will override any inputs from ZSAC             #####
#####################################################################################################################

#####################################################################################################################
##### Optional: ZPA Provider Resources. Skip to step 3. if you already have an  #####
##### App Connector Group + Provisioning Key.                                   #####
#####################################################################################################################

## 1. ZPA App Connector Provisioning Key variables. Uncomment and replace default values as desired for your deployment.
##    For any questions populating the below values, please reference:
##    https://registry.terraform.io/providers/zscaler/zpa/latest/docs/resources/zpa_provisioning_key

enrollment_cert            = "Service Edge"
provisioning_key_name      = "docker-prov-key"
provisioning_key_enabled   = true
provisioning_key_max_usage = 10

## 2. ZPA App Connector Group variables. Uncomment and replace default values as desired for your deployment.
##    For any questions populating the below values, please reference:
##    https://registry.terraform.io/providers/zscaler/zpa/latest/docs/resources/zpa_service_edge_group

service_edge_group_name                     = "docker-service-edge-group"
service_edge_group_description              = "docker-service-edge-group"
service_edge_group_enabled                  = true
service_edge_group_country_code             = "US"
service_edge_group_latitude                 = "37.33874"
service_edge_group_longitude                = "-121.8852525"
service_edge_group_location                 = "San Jose, CA, USA"
service_edge_group_upgrade_day              = "SUNDAY"
service_edge_group_upgrade_time_in_secs     = "66600"
service_edge_group_override_version_profile = true
service_edge_group_version_profile_id       = "2"
service_edge_group_is_public                = true
service_edge_group_grace_distance_enabled   = true
service_edge_group_grace_distance_value     = "10"
service_edge_group_grace_distance_value_unit = "MILES"


#####################################################################################################################
##### Optional: ZPA Provider Resources. Skip to step 5. if you added values for steps 1. and 2. #####
##### meaning you do NOT have a provisioning key already.                                       #####
#####################################################################################################################

## 3. By default, this script will create a new App Connector Group Provisioning Key.
##     Unccoment if you want to use an existing provisioning key (true or false. Default: false)

#byo_provisioning_key                           = true

## 4. Provide your existing provisioning key name. Only uncomment and modify if yo uset byo_provisioning_key to true

#byo_provisioning_key_name                      = "example-key-name"

capabilities = {
  add  = ["cap_net_admin", "cap_net_bind_service", "cap_net_raw", "cap_sys_nice", "cap_sys_time", "cap_sys_resource",]
  drop = []
}

## 8. The number of App Connector Containers to Deploy
pse_count = 4

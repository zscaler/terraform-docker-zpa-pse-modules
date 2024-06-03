# Zscaler ZPA Provider App Connector Group Module

This module provides the resources necessary to create a new ZPA App Connector Group to be used with App Connector appliance deployment and provisioining. This module is not intended to be used for any existing ZPA App Connector Groups created outside of Terraform.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.7, < 2.0.0 |
| <a name="requirement_zpa"></a> [zpa](#requirement\_zpa) | ~> 3.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_zpa"></a> [zpa](#provider\_zpa) | ~> 3.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [zpa_service_edge_group.service_edge_group](https://registry.terraform.io/providers/zscaler/zpa/latest/docs/resources/service_edge_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_service_edge_group_city_country"></a> [service\_edge\_group\_city\_country](#input\_service\_edge\_group\_city\_country) | Optional: The city and country of the ZPA Private Service Edge. example 'Oregon City, US' | `string` | `""` | no |
| <a name="input_service_edge_group_country_code"></a> [service\_edge\_group\_country\_code](#input\_service\_edge\_group\_country\_code) | Optional: Country code of this App Connector Group. example 'US' | `string` | `""` | no |
| <a name="input_service_edge_group_description"></a> [service\_edge\_group\_description](#input\_service\_edge\_group\_description) | Optional: Description of the App Connector Group | `string` | `""` | no |
| <a name="input_service_edge_group_enabled"></a> [service\_edge\_group\_enabled](#input\_service\_edge\_group\_enabled) | Whether this App Connector Group is enabled or not | `bool` | `true` | no |
| <a name="input_service_edge_group_grace_distance_enabled"></a> [service\_edge\_group\_grace\_distance\_enabled](#input\_service\_edge\_group\_grace\_distance\_enabled) | Allows ZPA Private Service Edge Groups within the specified distance to be prioritized over a closer ZPA Public Service Edge. | `bool` | `true` | no |
| <a name="input_service_edge_group_grace_distance_value"></a> [service\_edge\_group\_grace\_distance\_value](#input\_service\_edge\_group\_grace\_distance\_value) | Indicates the maximum distance in miles or kilometers to ZPA Private Service Edge groups that would override a ZPA Public Service Edge. | `string` | `"10"` | no |
| <a name="input_service_edge_group_grace_distance_value_unit"></a> [service\_edge\_group\_grace\_distance\_value\_unit](#input\_service\_edge\_group\_grace\_distance\_value\_unit) | Optional: ID of the version profile. To learn more, see Version Profile Use Cases. https://help.zscaler.com/zpa/configuring-version-profile | `string` | `"MILES"` | no |
| <a name="input_service_edge_group_is_public"></a> [service\_edge\_group\_is\_public](#input\_service\_edge\_group\_is\_public) | Optional: App Connectors in this group will attempt to update to a newer version of the software during this specified time. Default value: 66600. Integer in seconds (i.e., 66600). The integer should be greater than or equal to 0 and less than 86400, in 15 minute intervals | `string` | `true` | no |
| <a name="input_service_edge_group_latitude"></a> [service\_edge\_group\_latitude](#input\_service\_edge\_group\_latitude) | Latitude of the App Connector Group. Integer or decimal. With values in the range of -90 to 90 | `string` | n/a | yes |
| <a name="input_service_edge_group_location"></a> [service\_edge\_group\_location](#input\_service\_edge\_group\_location) | location of the App Connector Group in City, State, Country format. example: '120 Holger Way, San Jose, CA 95134, USA' | `string` | n/a | yes |
| <a name="input_service_edge_group_longitude"></a> [service\_edge\_group\_longitude](#input\_service\_edge\_group\_longitude) | Longitude of the App Connector Group. Integer or decimal. With values in the range of -90 to 90 | `string` | n/a | yes |
| <a name="input_service_edge_group_name"></a> [service\_edge\_group\_name](#input\_service\_edge\_group\_name) | Name of the App Connector Group | `string` | n/a | yes |
| <a name="input_service_edge_group_override_version_profile"></a> [service\_edge\_group\_override\_version\_profile](#input\_service\_edge\_group\_override\_version\_profile) | Optional: Whether the default version profile of the App Connector Group is applied or overridden. Default: false | `bool` | `false` | no |
| <a name="input_service_edge_group_upgrade_day"></a> [service\_edge\_group\_upgrade\_day](#input\_service\_edge\_group\_upgrade\_day) | Optional: App Connectors in this group will attempt to update to a newer version of the software during this specified day. Default value: SUNDAY. List of valid days (i.e., SUNDAY, MONDAY, etc) | `string` | `"SUNDAY"` | no |
| <a name="input_service_edge_group_upgrade_time_in_secs"></a> [service\_edge\_group\_upgrade\_time\_in\_secs](#input\_service\_edge\_group\_upgrade\_time\_in\_secs) | Optional: App Connectors in this group will attempt to update to a newer version of the software during this specified time. Default value: 66600. Integer in seconds (i.e., 66600). The integer should be greater than or equal to 0 and less than 86400, in 15 minute intervals | `string` | `"66600"` | no |
| <a name="input_service_edge_group_version_profile_id"></a> [service\_edge\_group\_version\_profile\_id](#input\_service\_edge\_group\_version\_profile\_id) | Optional: ID of the version profile. To learn more, see Version Profile Use Cases. https://help.zscaler.com/zpa/configuring-version-profile | `string` | `"2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_edge_group_id"></a> [service\_edge\_group\_id](#output\_service\_edge\_group\_id) | ZPA App Connector Group ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

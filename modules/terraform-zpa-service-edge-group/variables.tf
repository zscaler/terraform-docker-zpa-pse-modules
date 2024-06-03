variable "service_edge_group_name" {
  type        = string
  description = "Name of the App Connector Group"
}

variable "service_edge_group_description" {
  type        = string
  description = "Optional: Description of the App Connector Group"
  default     = ""
}

variable "service_edge_group_enabled" {
  type        = bool
  description = "Whether this App Connector Group is enabled or not"
  default     = true
}

variable "service_edge_group_country_code" {
  type        = string
  description = "Optional: Country code of this App Connector Group. example 'US'"
  default     = ""
}

variable "service_edge_group_city_country" {
  type        = string
  description = "Optional: The city and country of the ZPA Private Service Edge. example 'Oregon City, US'"
  default     = ""
}

variable "service_edge_group_latitude" {
  type        = string
  description = "Latitude of the App Connector Group. Integer or decimal. With values in the range of -90 to 90"
}

variable "service_edge_group_longitude" {
  type        = string
  description = "Longitude of the App Connector Group. Integer or decimal. With values in the range of -90 to 90"
}

variable "service_edge_group_location" {
  type        = string
  description = "location of the App Connector Group in City, State, Country format. example: 'San Jose, CA, USA'"
}

variable "service_edge_group_upgrade_day" {
  type        = string
  description = "Optional: App Connectors in this group will attempt to update to a newer version of the software during this specified day. Default value: SUNDAY. List of valid days (i.e., SUNDAY, MONDAY, etc)"
  default     = "SUNDAY"
}

variable "service_edge_group_upgrade_time_in_secs" {
  type        = string
  description = "Optional: App Connectors in this group will attempt to update to a newer version of the software during this specified time. Default value: 66600. Integer in seconds (i.e., 66600). The integer should be greater than or equal to 0 and less than 86400, in 15 minute intervals"
  default     = "66600"
}

variable "service_edge_group_override_version_profile" {
  type        = bool
  description = "Optional: Whether the default version profile of the App Connector Group is applied or overridden. Default: false"
  default     = false
}

variable "service_edge_group_version_profile_id" {
  type        = string
  description = "Optional: ID of the version profile. To learn more, see Version Profile Use Cases. https://help.zscaler.com/zpa/configuring-version-profile"
  default     = "2"

  validation {
    condition = (
      var.service_edge_group_version_profile_id == "0" || #Default = 0
      var.service_edge_group_version_profile_id == "1" || #Previous Default = 1
      var.service_edge_group_version_profile_id == "2"    #New Release = 2
    )
    error_message = "Input service_edge_group_version_profile_id must be set to an approved value."
  }
}

variable "service_edge_group_is_public" {
  type        = string
  description = "Optional: App Connectors in this group will attempt to update to a newer version of the software during this specified time. Default value: 66600. Integer in seconds (i.e., 66600). The integer should be greater than or equal to 0 and less than 86400, in 15 minute intervals"
  default     = true
}

variable "service_edge_group_grace_distance_enabled" {
  type        = bool
  description = "Allows ZPA Private Service Edge Groups within the specified distance to be prioritized over a closer ZPA Public Service Edge."
  default     = true
}

variable "service_edge_group_grace_distance_value" {
  type        = string
  description = "Indicates the maximum distance in miles or kilometers to ZPA Private Service Edge groups that would override a ZPA Public Service Edge."
  default     = "10"
}

variable "service_edge_group_grace_distance_value_unit" {
  type        = string
  description = "Optional: ID of the version profile. To learn more, see Version Profile Use Cases. https://help.zscaler.com/zpa/configuring-version-profile"
  default     = "MILES"

  validation {
    condition = (
      var.service_edge_group_grace_distance_value_unit == "KMS" ||
      var.service_edge_group_grace_distance_value_unit == "MILES"
    )
    error_message = "Input grace_distance_value_unit must be set to KMS or MILES."
  }
}

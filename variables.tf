########################
####     Intel      ####
########################

# Intel instance selection done at the Plan level

########################
####    Required    ####
########################

variable "app_name" {
  description = "The name of the Windows Web App Service."
  type        = string
}

#Location is derived from the resource group
variable "resource_group_name" {
  description = "The name of the Resource Group in which to create the Windows Web App Service."
  type        = string
}

variable "service_plan_id" {
  description = "The ID of the App Service Plan within which to create this Windows Web App Service."
  type        = string
}
########################
####     Other      ####
########################

variable "active_directory_auth_settings" {
  description = "A active_directory_auth_settings block."
  type        = any
  default     = {}
}

variable "app_settings" {
  description = "A map of key/value pairs of App Settings."
  type        = map(any)
  default     = {}
}

variable "client_certificate_enabled" {
  description = "Should the App Service require a client certificate to be present on incoming requests?"
  type        = bool
  default     = false
}

variable "client_affinity_enabled" {
  description = "Should the App Service send session affinity cookies, which route client requests in the same session to the same instance?"
  type        = bool
  default     = false
}

variable "client_certificate_mode" {
  description = "The client certificate mode. Possible values are Optional, Required, and Ignore."
  type        = string
  default     = "Optional"
}

variable "connection_strings" {
  description = "A connection_string block, see examples folder for details on how to use it."
  type        = list(map(string))
  default     = []
}

variable "enabled" {
  description = "Should the App Service be enabled?"
  type        = bool
  default     = true
}

variable "https_only" {
  description = "Should the App Service only allow HTTPS traffic?"
  type        = bool
  default     = true
}

variable "identity_ids" {
  description = "A list of User Assigned Managed Identity IDs to be assigned to this Windows Web App."
  type        = list(string)
  default     = []
}

variable "identity_type" {
  description = "The type of identity to use for the App Service. Possible values are SystemAssigned and UserAssigned."
  type        = string
  default     = "SystemAssigned"
}

variable "settings" {
  description = "A block of settings which can be used for various features of the App Service, see examples folder for details on how to use it."
  default     = false
  type        = any
}

variable "site_config" {
  description = "A site_config block, see examples folder for details on how to use it."
  type        = any
  default     = {}
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "vnet_integration_subnet_id" {
  description = "The ID of the Subnet within the Virtual Network to which the App Service should be integrated."
  type        = string
  default     = ""
}

variable "web_app_vnet_integration_enabled" {
  description = "Should the App Service be integrated with a Virtual Network?"
  type        = bool
  default     = false
}

variable "zip_deploy_file" {
  description = "The local path and filename to the zip file to deploy to the App Service."
  type        = string
  default     = null
}

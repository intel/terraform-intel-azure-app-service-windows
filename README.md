<p align="center">
  <img src="https://github.com/intel/terraform-intel-azure-app-service-windows/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel® Cloud Optimization Modules for Terraform  

© Copyright 2022, Intel Corporation

## Intel Cloud Optimization Module - Azure App Service Windows Web App

Module usage for creating an Azure App Service Windows Web App

## Usage

**See examples folder for complete examples.**

By default, for the Windows App Web you only have to pass four variables

```hcl
app_name
resource_group_name
service_plan_id
settings = {
    site_config = {
      application_stack = {
        node_version = "18-lts"
      }
    }
}

```

An app service web app needs a App Service Plan, for that look at the [Intel App Service Plan module.](https://registry.terraform.io/modules/intel/azure-app-service-plan/intel/latest)

main.tf

```hcl

# Create App Service Plan
module "intel-optimized-service-plan" {
  source              = "intel/azure-app-service-plan/intel"
  version             = "~>1.0.0"
  service_plan_name   = "windows-service-plan-103"
  resource_group_name = "terraform-testing-rg"
  os_type             = "Windows"
}

# Create App Service
module "windows-app-service" {
  source              = "intel/azure-app-service-windows/intel"
  version             = "~>1.0.0"
  app_name            = "windows-app-service-103"
  resource_group_name = "terraform-testing-rg"
  service_plan_id     = module.intel-optimized-service-plan.id
  #Site_config is required. See docs at https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_web_app#site_config
  settings = {
    site_config = {
      application_stack = {
        node_version = "~18"
      }
    }
  }
}

```

Run Terraform

```hcl
terraform init  
terraform plan
terraform apply 
```

## Considerations

Settings.site_config is required, documentation link:

<https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_web_app#site_config>

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_app_service_virtual_network_swift_connection.vnet_integration](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_virtual_network_swift_connection) | resource |
| [azurerm_windows_web_app.web_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_web_app) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_directory_auth_settings"></a> [active\_directory\_auth\_settings](#input\_active\_directory\_auth\_settings) | A active\_directory\_auth\_settings block. | `any` | `{}` | no |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | The name of the Windows Web App Service. | `string` | n/a | yes |
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | A map of key/value pairs of App Settings. | `map(any)` | `{}` | no |
| <a name="input_client_affinity_enabled"></a> [client\_affinity\_enabled](#input\_client\_affinity\_enabled) | Should the App Service send session affinity cookies, which route client requests in the same session to the same instance? | `bool` | `false` | no |
| <a name="input_client_certificate_enabled"></a> [client\_certificate\_enabled](#input\_client\_certificate\_enabled) | Should the App Service require a client certificate to be present on incoming requests? | `bool` | `false` | no |
| <a name="input_client_certificate_mode"></a> [client\_certificate\_mode](#input\_client\_certificate\_mode) | The client certificate mode. Possible values are Optional, Required, and Ignore. | `string` | `"Optional"` | no |
| <a name="input_connection_strings"></a> [connection\_strings](#input\_connection\_strings) | A connection\_string block, see examples folder for details on how to use it. | `list(map(string))` | `[]` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Should the App Service be enabled? | `bool` | `true` | no |
| <a name="input_https_only"></a> [https\_only](#input\_https\_only) | Should the App Service only allow HTTPS traffic? | `bool` | `true` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | A list of User Assigned Managed Identity IDs to be assigned to this Windows Web App. | `list(string)` | `[]` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | The type of identity to use for the App Service. Possible values are SystemAssigned and UserAssigned. | `string` | `"SystemAssigned"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group in which to create the Windows Web App Service. | `string` | n/a | yes |
| <a name="input_service_plan_id"></a> [service\_plan\_id](#input\_service\_plan\_id) | The ID of the App Service Plan within which to create this Windows Web App Service. | `string` | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | A block of settings which can be used for various features of the App Service, see examples folder for details on how to use it. | `any` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_vnet_integration_subnet_id"></a> [vnet\_integration\_subnet\_id](#input\_vnet\_integration\_subnet\_id) | The ID of the Subnet within the Virtual Network to which the App Service should be integrated. | `string` | `""` | no |
| <a name="input_web_app_vnet_integration_enabled"></a> [web\_app\_vnet\_integration\_enabled](#input\_web\_app\_vnet\_integration\_enabled) | Should the App Service be integrated with a Virtual Network? | `bool` | `false` | no |
| <a name="input_zip_deploy_file"></a> [zip\_deploy\_file](#input\_zip\_deploy\_file) | The local path and filename to the zip file to deploy to the App Service. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_outbound_ip_addresses"></a> [outbound\_ip\_addresses](#output\_outbound\_ip\_addresses) | The outbound IP addresses of the App Service. |
| <a name="output_possible_outbound_ip_addresses"></a> [possible\_outbound\_ip\_addresses](#output\_possible\_outbound\_ip\_addresses) | The possible outbound IP addresses of the App Service. |
| <a name="output_site_credentials"></a> [site\_credentials](#output\_site\_credentials) | The site credentials of the App Service. |
| <a name="output_web_app_id"></a> [web\_app\_id](#output\_web\_app\_id) | The ID of the App Service. |
| <a name="output_web_app_identity"></a> [web\_app\_identity](#output\_web\_app\_identity) | The identity of the App Service. |
| <a name="output_web_app_kind"></a> [web\_app\_kind](#output\_web\_app\_kind) | The kind of the App Service. |
| <a name="output_web_app_name"></a> [web\_app\_name](#output\_web\_app\_name) | The name of the App Service. |
| <a name="output_web_app_url"></a> [web\_app\_url](#output\_web\_app\_url) | The URL of the App Service. |
<!-- END_TF_DOCS -->
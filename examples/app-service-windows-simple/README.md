<p align="center">
  <img src="https://github.com/intel/terraform-intel-azure-app-service-windows/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel® Optimized Cloud Modules for Terraform  

© Copyright 2024, Intel Corporation

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
  tags = {
    "Owner"    = "user@company.com"
    "Duration" = "4"
  }
}

# Create App Service
module "windows-app-service" {
  source              = "intel/azure-app-service-windows/intel"
  version             = "~>1.0.0"
  app_name            = "windows-app-service-103"
  resource_group_name = "terraform-testing-rg"
  service_plan_id     = module.intel-optimized-service-plan.id
  # Tags
  tags = {
    "Owner"    = "user@company.com"
    "Duration" = "4"
  }
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

settings site_config is required <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_web_app#site_config>

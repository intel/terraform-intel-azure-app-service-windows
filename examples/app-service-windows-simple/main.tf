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
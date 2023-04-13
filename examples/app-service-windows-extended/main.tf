# Acquire Azure Subnet ID for VNET Integration
data "azurerm_subnet" "subnet" {
  name                 = "default"
  virtual_network_name = "akscluster50vnet"
  resource_group_name  = "terraform-testing-rg"
}

# Create App Service Plan
module "intel-optimized-service-plan" {
  source              = "intel/azure-app-service-plan/intel"
  version             = "~>1.0.0"
  service_plan_name   = "windows-service-plan-104"
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
  app_name            = "windows-app-service-104"
  resource_group_name = "terraform-testing-rg"
  service_plan_id     = module.intel-optimized-service-plan.id
  # Application settings
  app_settings = {
    "key1" = "value1"
    "key2" = "value2"
    "key3" = "value3"
  }
  # Tags
  tags = {
    "Owner"    = "user@company.com"
    "Duration" = "4"
  }
  #Site_config is required. See docs at https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_web_app#site_config
  settings = {
    site_config = {
      application_stack = {
        current_stack = "java"
        java_version  = "17"
      }
      # Enable inbound firewall
      ip_restriction = [

        {
          name       = "aks cluster subnet"
          ip_address = "10.50.0.0/24"
          priority   = "110"
          action     = "Allow"
        },
        {
          name       = "test subnet"
          ip_address = "10.100.0.0/24"
          priority   = "200"
          action     = "Allow"
        },
        {
          name       = "dev subnet"
          ip_address = "10.110.0.0/24"
          priority   = "300"
          action     = "Allow"
        }
      ]
    }
  }
  # Enable Outbound VNET Integration. Ensure delagation is enabled for "Microsoft.Web/serverFarms" on the subnet.
  web_app_vnet_integration_enabled = true
  vnet_integration_subnet_id       = data.azurerm_subnet.subnet.id
}
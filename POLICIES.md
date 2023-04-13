<p align="center">
  <img src="https://github.com/intel/terraform-intel-azure-app-service-windows/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel® Cloud Optimization Modules for Terraform  

© Copyright 2022, Intel Corporation

## HashiCorp Sentinel Policies

This file documents the HashiCorp Sentinel policies that apply to this module

Note: Intel Instance specific policies are available in the Azure Service Plan Module

## Policy 1

Description: Ensure encrypted HTTP traffic of Azure App Service Windows Web App

Resource type: azurerm_windows_web_app

Parameter: https_only

Allowed Types: true


## Policy 2

Description: Ensure HTTP2 is enabled for Azure App Service Windows Web App

Resource type: azurerm_windows_web_app

Parameter: "site_config": ["http2_enabled": true]

Allowed Types: true

## Policy 3

Description: Ensure minimum TLS version is 1.2 is enabled for Azure App Service Windows Web App

Resource type: azurerm_windows_web_app

Parameter: "site_config": ["minimum_tls_version": "1.2"]

Allowed Types: "1.2"

output "web_app_name" {
  description = "The name of the App Service."
  value       = module.windows-app-service.web_app_name

}

output "web_app_id" {
  description = "The ID of the App Service."
  value       = module.windows-app-service.web_app_id

}

output "web_app_url" {
  description = "The URL of the App Service."
  value       = module.windows-app-service.web_app_url

}

output "web_app_identity" {
  description = "The identity of the App Service."
  value       = module.windows-app-service.web_app_identity

}

output "web_app_kind" {
  description = "The kind of the App Service."
  value       = module.windows-app-service.web_app_kind

}

output "outbound_ip_addresses" {
  description = "The outbound IP addresses of the App Service."
  value       = module.windows-app-service.outbound_ip_addresses

}

output "possible_outbound_ip_addresses" {
  description = "The possible outbound IP addresses of the App Service."
  value       = module.windows-app-service.possible_outbound_ip_addresses

}

output "site_credentials" {
  description = "The site credentials of the App Service."
  value       = module.windows-app-service.site_credentials
  sensitive   = true
}

output "api_management_subscriptions_allow_tracing" {
  description = "Map of allow_tracing values across all api_management_subscriptions, keyed the same as var.api_management_subscriptions"
  value       = { for k, v in azurerm_api_management_subscription.api_management_subscriptions : k => v.allow_tracing }
}
output "api_management_subscriptions_api_id" {
  description = "Map of api_id values across all api_management_subscriptions, keyed the same as var.api_management_subscriptions"
  value       = { for k, v in azurerm_api_management_subscription.api_management_subscriptions : k => v.api_id }
}
output "api_management_subscriptions_api_management_name" {
  description = "Map of api_management_name values across all api_management_subscriptions, keyed the same as var.api_management_subscriptions"
  value       = { for k, v in azurerm_api_management_subscription.api_management_subscriptions : k => v.api_management_name }
}
output "api_management_subscriptions_display_name" {
  description = "Map of display_name values across all api_management_subscriptions, keyed the same as var.api_management_subscriptions"
  value       = { for k, v in azurerm_api_management_subscription.api_management_subscriptions : k => v.display_name }
}
output "api_management_subscriptions_primary_key" {
  description = "Map of primary_key values across all api_management_subscriptions, keyed the same as var.api_management_subscriptions"
  value       = { for k, v in azurerm_api_management_subscription.api_management_subscriptions : k => v.primary_key }
  sensitive   = true
}
output "api_management_subscriptions_product_id" {
  description = "Map of product_id values across all api_management_subscriptions, keyed the same as var.api_management_subscriptions"
  value       = { for k, v in azurerm_api_management_subscription.api_management_subscriptions : k => v.product_id }
}
output "api_management_subscriptions_resource_group_name" {
  description = "Map of resource_group_name values across all api_management_subscriptions, keyed the same as var.api_management_subscriptions"
  value       = { for k, v in azurerm_api_management_subscription.api_management_subscriptions : k => v.resource_group_name }
}
output "api_management_subscriptions_secondary_key" {
  description = "Map of secondary_key values across all api_management_subscriptions, keyed the same as var.api_management_subscriptions"
  value       = { for k, v in azurerm_api_management_subscription.api_management_subscriptions : k => v.secondary_key }
  sensitive   = true
}
output "api_management_subscriptions_state" {
  description = "Map of state values across all api_management_subscriptions, keyed the same as var.api_management_subscriptions"
  value       = { for k, v in azurerm_api_management_subscription.api_management_subscriptions : k => v.state }
}
output "api_management_subscriptions_subscription_id" {
  description = "Map of subscription_id values across all api_management_subscriptions, keyed the same as var.api_management_subscriptions"
  value       = { for k, v in azurerm_api_management_subscription.api_management_subscriptions : k => v.subscription_id }
}
output "api_management_subscriptions_user_id" {
  description = "Map of user_id values across all api_management_subscriptions, keyed the same as var.api_management_subscriptions"
  value       = { for k, v in azurerm_api_management_subscription.api_management_subscriptions : k => v.user_id }
}


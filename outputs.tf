output "api_management_subscriptions" {
  description = "All api_management_subscription resources"
  value       = azurerm_api_management_subscription.api_management_subscriptions
  sensitive   = true
}
output "api_management_subscriptions_allow_tracing" {
  description = "List of allow_tracing values across all api_management_subscriptions"
  value       = [for k, v in azurerm_api_management_subscription.api_management_subscriptions : v.allow_tracing]
}
output "api_management_subscriptions_api_id" {
  description = "List of api_id values across all api_management_subscriptions"
  value       = [for k, v in azurerm_api_management_subscription.api_management_subscriptions : v.api_id]
}
output "api_management_subscriptions_api_management_name" {
  description = "List of api_management_name values across all api_management_subscriptions"
  value       = [for k, v in azurerm_api_management_subscription.api_management_subscriptions : v.api_management_name]
}
output "api_management_subscriptions_display_name" {
  description = "List of display_name values across all api_management_subscriptions"
  value       = [for k, v in azurerm_api_management_subscription.api_management_subscriptions : v.display_name]
}
output "api_management_subscriptions_primary_key" {
  description = "List of primary_key values across all api_management_subscriptions"
  value       = [for k, v in azurerm_api_management_subscription.api_management_subscriptions : v.primary_key]
  sensitive   = true
}
output "api_management_subscriptions_product_id" {
  description = "List of product_id values across all api_management_subscriptions"
  value       = [for k, v in azurerm_api_management_subscription.api_management_subscriptions : v.product_id]
}
output "api_management_subscriptions_resource_group_name" {
  description = "List of resource_group_name values across all api_management_subscriptions"
  value       = [for k, v in azurerm_api_management_subscription.api_management_subscriptions : v.resource_group_name]
}
output "api_management_subscriptions_secondary_key" {
  description = "List of secondary_key values across all api_management_subscriptions"
  value       = [for k, v in azurerm_api_management_subscription.api_management_subscriptions : v.secondary_key]
  sensitive   = true
}
output "api_management_subscriptions_state" {
  description = "List of state values across all api_management_subscriptions"
  value       = [for k, v in azurerm_api_management_subscription.api_management_subscriptions : v.state]
}
output "api_management_subscriptions_subscription_id" {
  description = "List of subscription_id values across all api_management_subscriptions"
  value       = [for k, v in azurerm_api_management_subscription.api_management_subscriptions : v.subscription_id]
}
output "api_management_subscriptions_user_id" {
  description = "List of user_id values across all api_management_subscriptions"
  value       = [for k, v in azurerm_api_management_subscription.api_management_subscriptions : v.user_id]
}


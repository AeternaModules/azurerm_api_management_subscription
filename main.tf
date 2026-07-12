data "azurerm_key_vault_secret" "primary_key" {
  for_each     = { for k, v in var.api_management_subscriptions : k => v if v.primary_key_key_vault_id != null && v.primary_key_key_vault_secret_name != null }
  name         = each.value.primary_key_key_vault_secret_name
  key_vault_id = each.value.primary_key_key_vault_id
}
data "azurerm_key_vault_secret" "secondary_key" {
  for_each     = { for k, v in var.api_management_subscriptions : k => v if v.secondary_key_key_vault_id != null && v.secondary_key_key_vault_secret_name != null }
  name         = each.value.secondary_key_key_vault_secret_name
  key_vault_id = each.value.secondary_key_key_vault_id
}
resource "azurerm_api_management_subscription" "api_management_subscriptions" {
  for_each = var.api_management_subscriptions

  api_management_name = each.value.api_management_name
  display_name        = each.value.display_name
  resource_group_name = each.value.resource_group_name
  allow_tracing       = each.value.allow_tracing
  api_id              = each.value.api_id
  primary_key         = each.value.primary_key != null ? each.value.primary_key : try(data.azurerm_key_vault_secret.primary_key[each.key].value, null)
  product_id          = each.value.product_id
  secondary_key       = each.value.secondary_key != null ? each.value.secondary_key : try(data.azurerm_key_vault_secret.secondary_key[each.key].value, null)
  state               = each.value.state
  subscription_id     = each.value.subscription_id
  user_id             = each.value.user_id
}


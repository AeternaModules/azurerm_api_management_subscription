variable "api_management_subscriptions" {
  description = <<EOT
Map of api_management_subscriptions, attributes below
Required:
    - api_management_name
    - display_name
    - resource_group_name
Optional:
    - allow_tracing
    - api_id
    - primary_key
    - primary_key_key_vault_id (alternative to primary_key - read from Key Vault instead)
    - primary_key_key_vault_secret_name (alternative to primary_key - read from Key Vault instead)
    - product_id
    - secondary_key
    - secondary_key_key_vault_id (alternative to secondary_key - read from Key Vault instead)
    - secondary_key_key_vault_secret_name (alternative to secondary_key - read from Key Vault instead)
    - state
    - subscription_id
    - user_id
EOT

  type = map(object({
    api_management_name                 = string
    display_name                        = string
    resource_group_name                 = string
    allow_tracing                       = optional(bool)
    api_id                              = optional(string)
    primary_key                         = optional(string)
    primary_key_key_vault_id            = optional(string)
    primary_key_key_vault_secret_name   = optional(string)
    product_id                          = optional(string)
    secondary_key                       = optional(string)
    secondary_key_key_vault_id          = optional(string)
    secondary_key_key_vault_secret_name = optional(string)
    state                               = optional(string)
    subscription_id                     = optional(string)
    user_id                             = optional(string)
  }))
  # --- Unconfirmed validation candidates, derived from azurerm_api_management_subscription's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: subscription_id
  #   source:    validation.Any(...) - no translation rule yet, add one
  # path: user_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: user_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: api_management_name
  #   source:    [from validate.ApiManagementServiceName] !matched
  # path: display_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: product_id
  #   source:    [from product.ValidateProductID] !ok
  # path: product_id
  #   source:    [from product.ValidateProductID] err != nil
  # path: api_id
  #   source:    [from api.ValidateApiID] !ok
  # path: api_id
  #   source:    [from api.ValidateApiID] err != nil
  # path: state
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
}


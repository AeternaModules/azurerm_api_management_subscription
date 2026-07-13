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
  validation {
    condition = alltrue([
      for k, v in var.api_management_subscriptions : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_subscriptions : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_subscriptions : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.api_management_subscriptions : (
        length(v.display_name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 10 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}


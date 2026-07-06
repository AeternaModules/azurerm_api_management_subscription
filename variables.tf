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
    - product_id
    - secondary_key
    - state
    - subscription_id
    - user_id
EOT

  type = map(object({
    api_management_name = string
    display_name        = string
    resource_group_name = string
    allow_tracing       = optional(bool) # Default: true
    api_id              = optional(string)
    primary_key         = optional(string)
    product_id          = optional(string)
    secondary_key       = optional(string)
    state               = optional(string) # Default: "submitted"
    subscription_id     = optional(string)
    user_id             = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.api_management_subscriptions : (
        length(v.display_name) > 0
      )
    ])
    error_message = "must not be empty"
  }
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


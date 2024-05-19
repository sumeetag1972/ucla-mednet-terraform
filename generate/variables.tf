## Define the variable to store the map
## Default map shows 3 combinations
## Each key of map represents base_name
## Each value of key represents resource_type

variable "intake_map" {
  description = "Map of base_name and resource_type"
  type        = map(string)
  default = {
    "vm"           = "virtual_machine"
    "keyvault"      = "key_vault"
    "storage-acct" = "storage_account"
  }
}

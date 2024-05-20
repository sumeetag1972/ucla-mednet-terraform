## Create local as naming_modules
## It will iterate over each pair of resource map, in a for loop and the resource map is already a defined variable
## For each pair, we create an entry in naming_modules map
## Key of each entry is base_name
## Value of each entry is an object with 2 attributes, base_name and resource_type
## Explained with example data set below
# naming_modules = {
##    "vm"           = {
##      base_name     = "vm"
##      resource_type = "virtual_machine"
##    }
##    "keyvault"      = {
##      base_name     = "keyvault"
##      resource_type = "key_vault"
##    }
##    "storage-acct" = {
##      base_name     = "storage-acct"
##      resource_type = "storage_account"
##    }
##  }


locals {
  naming_modules = {
    for base_name, resource_type in var.intake_map : 
      base_name => {
        base_name     = base_name
        resource_type = resource_type
      }
  }
}

## After finalizing the structure of naming_modules
## Pass the values to module containg code to generate resource_name

module "resource_name" {
  source = "../modules/resource_name"
  for_each = local.naming_modules

  base_name     = each.value.base_name
  resource_type = each.value.resource_type
}

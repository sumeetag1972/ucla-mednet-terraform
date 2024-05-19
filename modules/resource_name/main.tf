## Here we have the logic to generate the resource-name
## Only for virtual_machine, we will read first 9 values of original base_name since final total cannot excced 15
## vm- and -00 total 6 so first 9 as stated above and if original base_name does not exceed 9, we retain it as is

locals {
  vm_starting_base_name = length(var.base_name) > 9 ? "${substr(var.base_name, 0, 9)}" : var.base_name
  resource_name =  var.resource_type == "virtual_machine" ? "vm-${local.vm_starting_base_name}-00" : var.resource_type == "key_vault" ? "kv-${lower(var.base_name)}" : var.resource_type == "storage_account" ? replace("sa${lower(var.base_name)}", "-", "") : "Invalid resource type"
}


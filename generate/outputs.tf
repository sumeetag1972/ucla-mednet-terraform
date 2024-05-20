## Show output of each resource name separately
output "resource_names" {
  value = {
    for key, value in module.resource_name : key => value.resource_name
  }
}

## Show all outputs from child module
output "all_child_outputs" {
  value = module.resource_name
}
## The output named resource_name from each instance of child module, will be referenced 
## Now these will be exposed

output "resource_names" {
  value = module.resource_name[*].resource_name
}

## Now for future changes to output definition of child module, let us assume there is a child output which has key value pairs
## We have following code in child outputs.tf file
## output "additional_outputs" {
##  value = {
##    key1 = "value1"
##    key2 = "value2"
##  }
## }


output "all_outputs_of_child" {
  value = {
    for key, value in module.resource_name : key => value
  }
}


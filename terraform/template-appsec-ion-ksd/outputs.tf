output "group_name" {
  value     = data.akamai_group.group.group_name
  sensitive = false
}

output "contract_id" {
  value     = data.akamai_group.group.contract_id
  sensitive = false
}
/*
output "configuration_name" {
  value     = data.akamai_appsec_configuration.akamai_appsec.name
  sensitive = false
}
*/


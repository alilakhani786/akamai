output "group_name" {
  value     = data.akamai_group.group.group_name
  sensitive = false
}

output "contract_id" {
  value     = data.akamai_group.group.contract_id
  sensitive = false
}

output "product_id" {
  value     = akamai_property.res-property.product_id
  sensitive = false
}

output "ip_behavior" {
  value     = akamai_edge_hostname.res-edgeHostname.ip_behavior
  sensitive = false
}

output "edgeHostname" {
  value     = akamai_edge_hostname.res-edgeHostname.edge_hostname
  sensitive = false
}

output "certificate" {
  value     = akamai_edge_hostname.res-edgeHostname.certificate
  sensitive = false
}

output "cert_provisioning_type" {
  value     = akamai_property.res-property.hostnames[*].cert_provisioning_type
  sensitive = false
}

output "cnameFrom" {
    value = akamai_property.res-property.hostnames[*].cname_from
    sensitive = false
}
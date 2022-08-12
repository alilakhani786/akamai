output "group_name" {
  value     = data.akamai_group.group.group_name
  sensitive = false
}

output "contract_id" {
  value     = data.akamai_group.group.contract_id
  sensitive = false
}

output "edgeHostname" {
  value     = akamai_edge_hostname.edgehostname.edge_hostname
  sensitive = false
}

output "ip_behavior" {
  value     = akamai_edge_hostname.edgehostname.ip_behavior
  sensitive = false
}

output "hostname" {
  value     = akamai_dns_record.CNAME_record.name
  sensitive = false
}

output "zone" {
  value     = akamai_dns_record.CNAME_record.zone
  sensitive = false
}
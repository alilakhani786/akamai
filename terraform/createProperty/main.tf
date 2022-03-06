/*
  Author: Noorali (Ali) Lakhani @ nlakhani@akamai.com
  Creation date: 03/03/2022
  Description: Onboarding Delivery Configuration Automation Project
*/

locals {
  group_name  = "To be deleted"
  contract_id = "ctr_M-1YX7F61"
  product_id    = "prd_SPM"
  ip_behavior   = "IPV6_COMPLIANCE"
  edgehostname = "www.lakhanis.net.edgekey.net"
  certificate   = 124434
  cnameFrom = "www.lakhanis.net"
  cert_provisioning_type = "CPS_MANAGED"
  contact     = ["nlakhani@akamai.com"]
}

data "akamai_group" "group" {
  group_name  = local.group_name
  contract_id = local.contract_id
}

data "akamai_contract" "contract" {
  group_name = data.akamai_group.group.name
}

data "akamai_property_rules_template" "rules" {
  template_file = abspath("${path.module}/property-snippets/main.json")
}

resource "akamai_edge_hostname" "res-edgeHostname" {
  product_id    = local.contract_id
  contract_id   = data.akamai_contract.contract.id
  group_id      = data.akamai_group.group.id
  ip_behavior   = local.ip_behavior
  edge_hostname = local.edgehostname
  certificate   = local.certificate

}

# Akamai now supports cert_provisioning_type = "DEFAULT" (Secure by defalt) option
# for auto validation of DV certs for known CA's. please check terraform for akamai documentation
resource "akamai_property" "res-property" {
  name        = "www.lakhanis.net"
  product_id  = local.product_id
  group_id    = data.akamai_group.group.id
  contract_id = data.akamai_contract.contract.id
  hostnames {
    cname_from             = local.cnameFrom
    cname_to               = akamai_edge_hostname.res-edgeHostname.edge_hostname
    cert_provisioning_type = local.cert_provisioning_type
  }
  rule_format = "latest"
  rules       = data.akamai_property_rules_template.rules.json
}

/*
# Activate property in staging
resource "akamai_property_activation" "res-property" {
  property_id = akamai_property.res-property.id
  contact     = local.contact
  version     = akamai_property.res-property.latest_version
  network     = upper("staging")
  note        = "Test Automation"
}
*/
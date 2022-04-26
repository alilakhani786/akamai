/*
  Author: Noorali (Ali) Lakhani @ nlakhani@akamai.com
  Creation date: 03/03/2022
  Purpose: Automate Onboarding Akamai Delivery Configuration 
  Repo: https://github.com/alilakhani786/akamai/tree/main/terraform

  main.tf is the entry point to terraform project
*/

locals {}

data "akamai_group" "group" {
  group_name  = var.group_name
  contract_id = var.contract_id
}

data "akamai_contract" "contract" {
  group_name = var.group_name
}

data "akamai_property_rules_template" "rules" {
  template_file = abspath("${path.module}/property-snippets/main.json")

  variables {
    name  = "origin_hostname"
    value = var.origin_hostname
    type  = "string"
  }


  variables {
    name  = "cp_code"
    value = parseint(replace(akamai_cp_code.cp_code.id, "cpc_", ""), 10)
    type  = "number"
  }

}

resource "akamai_cp_code" "cp_code" {
  name        = var.cpcode_name
  group_id    = data.akamai_group.group.id
  contract_id = data.akamai_contract.contract.id
  product_id  = var.product_id
}

resource "akamai_edge_hostname" "res-edgeHostname" {
  product_id    = var.product_id
  contract_id   = data.akamai_contract.contract.id
  group_id      = data.akamai_group.group.id
  ip_behavior   = var.ip_behavior
  edge_hostname = var.edgeHostname
  certificate   = var.certificate
}

# Akamai now supports cert_provisioning_type = "DEFAULT" (Secure by defalt) option
# for auto validation of DV certs for known CA's. 
# Please check Terraform documentation for Akamai Terraform Provider
resource "akamai_property" "res-property" {
  name        = var.configuration_name
  product_id  = var.product_id
  group_id    = data.akamai_group.group.id
  contract_id = data.akamai_contract.contract.id
  hostnames {
    cname_from             = var.hostname
    cname_to               = var.edgeHostname
    cert_provisioning_type = var.cert_provisioning_type
  }
  rule_format = var.rule_format
  rules       = data.akamai_property_rules_template.rules.json
}

/*
# Activate property in staging
resource "akamai_property_activation" "res-property" {
  property_id = akamai_property.res-property.id
  contact     = var.contact
  version     = akamai_property.res-property.latest_version
  network     = upper("staging")
  note        = "Test Automation"
}
*/



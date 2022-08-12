terraform {
  required_providers {
    akamai = {
      source = "akamai/akamai"
    }
  }
  required_version = ">= 0.13"
}


provider "akamai" {
  edgerc         = "~/.edgerc"
  config_section = "default"
}



locals {}

//data "akamai_group" "group" {}

data "akamai_group" "group" {
  group_name  = var.group_name
  contract_id = var.contract_id
}

//data "akamai_contract" "contract" {}

data "akamai_contract" "contract" {
  group_name = var.group_name
}

resource "akamai_edge_hostname" "edgehostname" {
  product_id    = var.product_id
  contract_id   = data.akamai_contract.contract.id
  group_id      = data.akamai_group.group.id
  edge_hostname = var.edgeHostname
  ip_behavior   = var.ip_behavior

}

resource "akamai_dns_record" "CNAME_record" {
  zone       = var.zone
  name       = var.hostname  
  recordtype = "CNAME"
  active     = true
  ttl        = 300
  target     = ["${var.edgeHostname}"]  
}



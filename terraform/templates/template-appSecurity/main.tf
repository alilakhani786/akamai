data "akamai_group" "group" {
  group_name  = var.group_name
  contract_id = var.contract_id
}

# resource for the Akamai Application Security configuration, tied to an Akamai Contract and Group. Can have multiple hostnames.
resource "akamai_appsec_configuration" "akamai_appsec" {
  contract_id = replace(var.contract_id, "ctr_", "")
  group_id    = replace(data.akamai_group.group.id, "grp_", "")
  name        = var.configuration_name
  description = var.configuration_description
  host_names  = [var.hostname]
}

resource "akamai_appsec_security_policy" "security_policy" {
  config_id              = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_name   = var.first_policy_name
  security_policy_prefix = var.first_policy_prefix
  default_settings       = true
}

# resource to set Match Target for the Security Policy, settings are set in /appsec-snippets/match_targets.json.
resource "akamai_appsec_match_target" "match_target" {
  config_id = akamai_appsec_configuration.akamai_appsec.config_id
  match_target = templatefile("appsec-snippets/match-targets.json", {
    config_id           = akamai_appsec_configuration.akamai_appsec.config_id,
    hostname            = var.hostname,
    policy_id           = akamai_appsec_security_policy.security_policy.security_policy_id
    securitybypass_list = akamai_networklist_network_list.SECURITYBYPASSLIST.id
    }
  )
}

# resource to set all the Network Lists properly in DENY/BLOCKING mode.
# ipBlocklist.tf, geoBlockList.tf, securityBypassList.tf
resource "akamai_appsec_ip_geo" "ip_geo_block" {
  config_id                  = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id         = akamai_appsec_security_policy.security_policy.security_policy_id
  mode                       = "block"
  ip_network_lists           = [akamai_networklist_network_list.IPBLOCKLIST.id]
  geo_network_lists          = [akamai_networklist_network_list.GEOBLOCKLIST.id]
  exception_ip_network_lists = [akamai_networklist_network_list.IPBLOCKLISTEXCEPTIONS.id]
}

output "config_id" {
  value = akamai_appsec_configuration.akamai_appsec.config_id
}

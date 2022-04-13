# data source that sets the Akamai Group properly. Akamai Groups are part of an Akamai Contract.
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

# resource for the Akamai Application Security Policy, tied to an Application Security configuration.
resource "akamai_appsec_security_policy" "security_policy" {
  config_id              = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_name   = var.policy_name
  security_policy_prefix = var.policy_prefix
  default_settings       = true
}

# resource to set the Application Security mode. Currently set to Adaptive Security Engine in Automatic mode which required the least management.
resource "akamai_appsec_waf_mode" "default_policy" {
  config_id          = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id = akamai_appsec_security_policy.security_policy.security_policy_id
  mode               = "ASE_AUTO"
}

# resource to set how Akamai handles the Akamai Pragma Header. They will be removed by default UNLESS query string ENABLEDEBUG is added.
resource "akamai_appsec_advanced_settings_pragma_header" "pragma_header" {
  config_id          = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id = akamai_appsec_security_policy.security_policy.security_policy_id
  pragma_header      = file("${path.module}/appsec-snippets/pragma_header.json")
}

# resource to set Match Target for the Security Policy, settings are set in /appsec-snippets/match_targets.json.
resource "akamai_appsec_match_target" "match_target" {
  config_id = akamai_appsec_configuration.akamai_appsec.config_id
  match_target = templatefile("${path.module}/appsec-snippets/match_targets.json", {
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
/*
# resource to activate the Akamai Application Security configuration
resource "akamai_appsec_activations" "activation" {
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  network             = upper(var.network)
  notes               = var.activation_notes
  notification_emails = [var.email]
}
*/
/*
  Author: Noorali (Ali) Lakhani @ nlakhani@akamai.com
  Creation date: 03/03/2022
  Description: Onboarding Delivery Configuration Automation Project

  Contributers : (name/email)
  01 
  02
  03

*/

locals {}

/*

resource "akamai_appsec_configuration" "create_config" {
  contract_id = "M-1YX7F61"
  group_id    = replace(data.akamai_group.group.id, "grp_", "")
  name        = "lakhanisDotNet"
  description = "xxx"
  host_names  = ["www.lakhanis.net"]
}

output "create_config_id" {
 value = akamai_appsec_configuration.create_config.config_id
}


resource "akamai_appsec_configuration" "create_config" {
  contract_id = replace(var.contract_id, "ctr_", "")
  group_id    = replace(data.akamai_group.group.id, "grp_", "")
  name        = var.configuration_name
  description = var.configuration_description
  host_names  = ["dev.lakhanis.net"]
}
*/

# Akamai Security Configuration
# -----------------------------
# Scope: Contracts and Groups
# Creates a security configuration.
# The contract referenced in the request body determines the 
# type of configuration you can create.

resource "akamai_appsec_configuration" "akamai_appsec" {
  contract_id = replace(var.contract_id, "ctr_", "")
  group_id    = replace(data.akamai_group.group.id, "grp_", "")
  name        = var.configuration_name
  description = var.configuration_description
  host_names  = [var.hostname]

  //depends_on = [ akamai_property_activation.activation ]
}

output "create_config_id" {
 value = akamai_appsec_configuration.akamai_appsec.config_id
}

# Akamai Security Policy
# ----------------------
# Scope: Security Configuration
# Creates a new security policy. The resource enables you to 
# create a new policy preconfigured with the default security policy settings.

resource "akamai_appsec_security_policy" "security_policy" {
  config_id              = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_name   = var.policy_name
  security_policy_prefix = var.policy_prefix
}

resource "akamai_appsec_match_target" "match_target" {
  config_id = akamai_appsec_configuration.akamai_appsec.config_id
  match_target = templatefile("${path.module}/appsec-snippets/match_targets.json", { 
      config_id = akamai_appsec_configuration.akamai_appsec.config_id, 
      hostname = var.hostname, 
      policy_id = akamai_appsec_security_policy.security_policy.security_policy_id 
      securitybypass_list = akamai_networklist_network_list.SECURITYBYPASSLIST.id
      } 
    )
}

resource "akamai_networklist_network_list" "SECURITYBYPASSLIST" {
  name = "SECURITYBYPASSLIST"
  type = "IP"
  description = "SECURITYBYPASSLIST"
  list = [ "192.168.0.1", "192.168.0.2", "192.168.0.3", "192.168.0.5"]
  mode = "REPLACE"
}



data "akamai_group" "group" {
  group_name  = var.group_name
  contract_id = var.contract_id
}

data "akamai_contract" "contract" {
  group_name = var.group_name
}
data "akamai_appsec_configuration" "configurations" {

}

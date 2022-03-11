/*
  Author: Noorali (Ali) Lakhani @ nlakhani@akamai.com
  Creation date: 03/03/2022
  Description: Onboarding Delivery Configuration Automation Project
*/

locals {}

resource "akamai_appsec_configuration" "akamai_appsec" {
  contract_id = replace(var.contract_id, "ctr_", "")
  group_id    = replace(data.akamai_group.group.id, "grp_", "")
  name        = var.configuration_name
  description = var.configuration_description
  host_names  = [var.hostname]

  //depends_on = [ akamai_property_activation.activation ]
}

resource "akamai_appsec_security_policy" "security_policy" {
  config_id              = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_name   = var.policy_name
  security_policy_prefix = var.policy_prefix
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

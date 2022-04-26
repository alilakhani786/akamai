# the following variables reflect the ACTION for each of the Rate Policies, Slow POST Protection and Attack Groups. Can be set to ALERT, DENY or NONE.

variable "attack_group_web_attack_tool_action" {}
variable "attack_group_web_protocol_attack_action" {}
variable "attack_group_sql_injection_action" {}
variable "attack_group_cross_site_scripting_action" {}
variable "attack_group_local_file_inclusion_action" {}
variable "attack_group_remote_file_inclusion_action" {}
variable "attack_group_command_injection_action" {}
variable "attack_group_web_platform_attack_action" {}
variable "attack_group_web_policy_violation_action" {}
variable "attack_group_total_outbound_action" {}

# 10 resources that reflect the Adaptive Security Engine Attack Groups. Exception can be added in JSON for each of the groups. Actions can be set to ALERT/DENY/NONE in variables.

resource "akamai_appsec_attack_group" "attack_group_web_attack_tool" {
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "WAT"
  attack_group_action = var.attack_group_web_attack_tool_action
  condition_exception = file("${path.module}/appsec-snippets/attack-groups/attack_group_web_attack_tool_exception.json")
}

resource "akamai_appsec_attack_group" "attack_group_web_protocol_attack" {
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "PROTOCOL"
  attack_group_action = var.attack_group_web_protocol_attack_action
  condition_exception = file("${path.module}/appsec-snippets/attack-groups/attack_group_web_protocol_attack_exception.json")
}

resource "akamai_appsec_attack_group" "attack_group_sql_injection" {
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "SQL"
  attack_group_action = var.attack_group_sql_injection_action
  condition_exception = file("${path.module}/appsec-snippets/attack-groups/attack_group_sql_injection_exception.json")
}

resource "akamai_appsec_attack_group" "attack_group_cross_site_scripting" {
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "XSS"
  attack_group_action = var.attack_group_cross_site_scripting_action
  condition_exception = file("${path.module}/appsec-snippets/attack-groups/attack_group_cross_site_scripting_exception.json")
}

resource "akamai_appsec_attack_group" "attack_group_local_file_inclusion" {
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "LFI"
  attack_group_action = var.attack_group_local_file_inclusion_action
  condition_exception = file("${path.module}/appsec-snippets/attack-groups/attack_group_local_file_inclusion_exception.json")
}

resource "akamai_appsec_attack_group" "attack_group_remote_file_inclusion" {
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "RFI"
  attack_group_action = var.attack_group_remote_file_inclusion_action
  condition_exception = file("${path.module}/appsec-snippets/attack-groups/attack_group_remote_file_inclusion_exception.json")
}

resource "akamai_appsec_attack_group" "attack_group_command_injection" {
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "CMD"
  attack_group_action = var.attack_group_command_injection_action
  condition_exception = file("${path.module}/appsec-snippets/attack-groups/attack_group_command_injection_exception.json")
}

resource "akamai_appsec_attack_group" "attack_group_web_platform_attack" {
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "PLATFORM"
  attack_group_action = var.attack_group_web_platform_attack_action
  condition_exception = file("${path.module}/appsec-snippets/attack-groups/attack_group_web_platform_attack_exception.json")
}

resource "akamai_appsec_attack_group" "attack_group_web_policy_violation" {
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "POLICY"
  attack_group_action = var.attack_group_web_policy_violation_action
  condition_exception = file("${path.module}/appsec-snippets/attack-groups/attack_group_web_policy_violation_exception.json")
}

# Total Outbound is typically set to Not Used/None because it can negatively impact performance. Enable into ALERT/DENY with care.
resource "akamai_appsec_attack_group" "attack_group_total_outbound" {
  config_id           = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id  = akamai_appsec_security_policy.security_policy.security_policy_id
  attack_group        = "OUTBOUND"
  attack_group_action = var.attack_group_total_outbound_action
  #condition_exception = file("${path.module}/appsec-snippets/attack-groups/attack_group_total_outbound_exception.json")
}
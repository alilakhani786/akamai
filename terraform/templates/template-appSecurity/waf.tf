locals {
  sec_id = akamai_appsec_security_policy.security_policy.security_policy_id
  conf_id = akamai_appsec_configuration.akamai_appsec.config_id
}

# resource to set the Application Security mode. Currently set to Adaptive Security Engine in Automatic mode which required the least management.
resource "akamai_appsec_waf_mode" "default_policy" {
  config_id          = local.conf_id
  security_policy_id = local.sec_id
  mode               = "ASE_AUTO"
}

resource "akamai_appsec_attack_group" "web_policy_violation" {
config_id          = local.conf_id
  security_policy_id = local.sec_id
  attack_group        = "POLICY"
  attack_group_action = "alert"
}

resource "akamai_appsec_attack_group" "web_attack_tool" {
config_id          = local.conf_id
  security_policy_id = local.sec_id
  attack_group        = "WAT"
  attack_group_action = "alert"
}

resource "akamai_appsec_attack_group" "web_protocol_attack" {
  config_id          = local.conf_id
  security_policy_id = local.sec_id
  attack_group        = "PROTOCOL"
  attack_group_action = "alert"
}

resource "akamai_appsec_attack_group" "SQL_Injection" {
  config_id          = local.conf_id
  security_policy_id = local.sec_id
  attack_group        = "SQL"
  attack_group_action = "alert"
}

resource "akamai_appsec_attack_group" "XSS" {
  config_id          = local.conf_id
  security_policy_id = local.sec_id
  attack_group        = "XSS"
  attack_group_action = "alert"
}

resource "akamai_appsec_attack_group" "CMD" {
  config_id          = local.conf_id
  security_policy_id = local.sec_id
  attack_group        = "CMD"
  attack_group_action = "alert"
}

resource "akamai_appsec_attack_group" "LFI" {
  config_id          = local.conf_id
  security_policy_id = local.sec_id
  attack_group        = "LFI"
  attack_group_action = "alert"
}

resource "akamai_appsec_attack_group" "RFI" {
  config_id          = local.conf_id
  security_policy_id = local.sec_id
  attack_group        = "RFI"
  attack_group_action = "alert"
}

resource "akamai_appsec_attack_group" "Web_Platform_Attack" {
  config_id          = local.conf_id
  security_policy_id = local.sec_id
  attack_group        = "PLATFORM"
  attack_group_action = "alert"
}

resource "akamai_appsec_attack_group" "OUTBOUND" {
  config_id          = local.conf_id
  security_policy_id = local.sec_id
  attack_group        = "OUTBOUND"
  attack_group_action = "alert"
}
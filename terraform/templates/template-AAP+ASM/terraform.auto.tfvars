edgerc_config_section     = "" # variable edgerc_config_section to define which config_section to use inside the edgerc file.
contract_id               = "" # Your our Akamai Contract ID.
group_name                = "" # Name of your group you want to store your config. Groups are part of an Akamai contract.
configuration_name        = ""
configuration_description = ""

hostname = ""

policy_name   = ""
policy_prefix = ""

securitybypass_list     = [""] # the list of IP/CIDR addresses you want to be able to bypass the security policy.
ipblock_list            = [""] # the list of IP/CIDR addresses you want to block
ipblock_list_exceptions = [""] # the list of IP/CIDR addresses you want to block
geoblock_list           = [""] # the list of GEO country codes you want to block

ratepolicy_page_view_requests_action = "" # Alert or Deny
ratepolicy_origin_error_action       = "" # Alert or Deny
ratepolicy_post_requests_action      = "" # Alert or Deny
slow_post_protection_action          = "" # Alert or Deny

attack_group_web_attack_tool_action       = ""     # Alert or Deny.
attack_group_web_protocol_attack_action   = ""     # Alert or Deny
attack_group_sql_injection_action         = ""     # Alert or Deny
attack_group_cross_site_scripting_action  = ""     # Alert or Deny
attack_group_local_file_inclusion_action  = ""     # Alert or Deny
attack_group_remote_file_inclusion_action = ""     # Alert or Deny
attack_group_command_injection_action     = ""     # Alert or Deny
attack_group_web_platform_attack_action   = ""     # Alert or Deny
attack_group_web_policy_violation_action  = ""     # Alert or Deny
attack_group_total_outbound_action        = "none" # Alert or Deny

network          = "STAGING" # Staging / Production
email            = "nlakhani@akamai.com"
activation_notes = "AppSec configuration deployed with the Akamai Terraform Provider."

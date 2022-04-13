# variable edgerc_config_section to define which config_section to use inside the edgerc file.
edgerc_config_section = "akamai-technologies-AAPASMInteractive" # Recommended value: default

# variable contract_id reflects your Akamai Contract ID.
//contract_id = "ctr_V-434SAU2" #SEA
contract_id = "ctr_P-2TZWM9G"

# variable group_name reflects the name of your group you want to store your config. Groups are part of an Akamai contract.
//group_name = "playground" #SEA
group_name = "ASM Sandbox"

configuration_name = "ew.lakhanis.net"

configuration_description = "Security configuration ew.lakhanis.net"

hostname = "www.shopexample.com"

policy_name   = "Policy0"
policy_prefix = "AL10"

securitybypass_list     = ["192.0.0.3"] # the list of IP/CIDR addresses you want to be able to bypass the security policy.
ipblock_list            = ["192.0.0.1"] # the list of IP/CIDR addresses you want to block
ipblock_list_exceptions = ["192.0.0.2"] # the list of IP/CIDR addresses you want to block
geoblock_list           = ["MY"]        # the list of GEO country codes you want to block


ratepolicy_page_view_requests_action = "alert" # Action set to either alert or deny.
ratepolicy_origin_error_action       = "alert" # Action set to either alert or deny.
ratepolicy_post_requests_action      = "alert" # Action set to either alert or deny.
slow_post_protection_action          = "alert" # Action set to either alert or deny.

attack_group_web_attack_tool_action       = "alert"  # Action set to either alert or deny.
attack_group_web_protocol_attack_action   = "alert" # Action set to either alert or deny.
attack_group_sql_injection_action         = "alert" # Action set to either alert or deny.
attack_group_cross_site_scripting_action  = "alert" # Action set to either alert or deny.
attack_group_local_file_inclusion_action  = "alert" # Action set to either alert or deny.
attack_group_remote_file_inclusion_action = "alert" # Action set to either alert or deny.
attack_group_command_injection_action     = "alert" # Action set to either alert or deny.
attack_group_web_platform_attack_action   = "alert" # Action set to either alert or deny.
attack_group_web_policy_violation_action  = "alert" # Action set to either alert or deny.
attack_group_total_outbound_action        = "none"  # Action set to either alert or deny.

network          = "STAGING"
email            = "nlakhani@akamai.com"
activation_notes = "AppSec configuration deployed with the Akamai Terraform Provider." # Activation Notes, changing the notes will deploy a new version to your chosen Akamai network.

/*
edgerc_config_section = "default" # variable edgerc_config_section to define which config_section to use inside the edgerc file.
group_name      = "playground"                  # Name of your group you want to store your config.
contract_id     = "ctr_V-434SAU2"               # Contract ID
configuration_name = "ew.lakhanis.net"
configuration_description = "Security configuration ew.lakhanis.net"
hostname = "ew.lakhanis.net"
*/

edgerc_config_section     = "aapasminteractive"
contract_id               = "ctr_P-2TZWM9G"
group_name                = "ASM Sandbox"
configuration_name        = "ew.lakhanis.net"
configuration_description = "Security configuration ew.lakhanis.net"

hostname = "www.shopexample.com"

first_policy_name   = "PolicyOne"
first_policy_prefix = "ALI1"

network          = "STAGING"
email            = "nlakhani@akamai.com"
activation_notes = "AppSec configuration deployed with the Akamai Terraform Provider."

securitybypass_list     = ["192.0.0.3"]
geoblock_list           = ["MY"]        # the list of GEO country codes you want to block
ipblock_list            = ["192.0.0.1"] # the list of IP/CIDR addresses you want to block
ipblock_list_exceptions = ["192.0.0.2"] # the list of IP/CIDR addresses you want to block


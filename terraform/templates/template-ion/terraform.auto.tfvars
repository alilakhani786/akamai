group_name              = ""                  # Name of your group you want to store your config.
contract_id             = ""               # Contract ID
product_id              = ""                     # Product ID for the specific Akamai product you are using.
ip_behavior             = ""             # IPV4 for version 4 only, IPV6_PERFORMANCE for version 6 only, or IPV6_COMPLIANCE for both 4 and 6
origin_hostname         = ""     # Origin Hostname
edgeHostname            = "" # Akamai Edge Hostname you want to use, ending in *.akamaized.net, *.edgesuite.net or *.edgekey.net.
certificate             = 0                        # Enrollment ID: Required only when creating an Enhanced TLS edge hostname. 

# variable cert_provisioning_type reflects which type of HTTPS SSL/TLS Certificate method you use with Akamai. This can be CPS_MANAGED for certificates managed in Certificate Provisioning System or DEFAULT for Secure By Default feature.
cert_provisioning_type = ""
rule_format            = "" # Akamai PM rule format which includes updated behaviors for newer versions. 
cpcode_name            = ""
configuration_name     = ""
hostname               = ""
contact                = ["test@akamai.com"]
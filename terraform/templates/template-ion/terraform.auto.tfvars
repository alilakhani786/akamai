group_name = "playground" # Name of your group you want to store your config.
contract_id = "ctr_V-434SAU2" # Contract ID
product_id = "prd_SPM" # Product ID for the specific Akamai product you are using.
ip_behavior = "IPV6_COMPLIANCE" # IPV4 for version 4 only, IPV6_PERFORMANCE for version 6 only, or IPV6_COMPLIANCE for both 4 and 6
origin_hostname = "backend-ew.lakhanis.net" # Origin Hostname
edgeHostname = "ew.lakhanis.net.edgekey.net" # Akamai Edge Hostname you want to use, ending in *.akamaized.net, *.edgesuite.net or *.edgekey.net.
certificate = 143056 # Enrollment ID: Required only when creating an Enhanced TLS edge hostname. 
# variable cert_provisioning_type reflects which type of HTTPS SSL/TLS Certificate method you use with Akamai. This can be CPS_MANAGED for certificates managed in Certificate Provisioning System or DEFAULT for Secure By Default feature.
cert_provisioning_type = "CPS_MANAGED"
rule_format = "latest" # Akamai PM rule format which includes updated behaviors for newer versions. 
cpcode_name = "ew.lakhanis.net"
configuration_name = "ew.lakhanis.net"
hostname = "ew.lakhanis.net"
contact = ["nlakhani@akamai.com"]
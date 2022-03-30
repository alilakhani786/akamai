# variable group_name reflects the name of your group you want to store your config. Groups are part of an Akamai contract.
group_name = "playground" #"Akamai South East Asia SEA-V-434SAU2"
# variable contract_id reflects your Akamai Contract ID.
contract_id = "ctr_V-434SAU2"
# For some data sources and resources, you need to retrieve the ID for the specific Akamai product you are using.
product_id = "prd_Site_Accel"
# Version of the IP protocol to use: IPV4 for version 4 only, IPV6_PERFORMANCE for version 6 only, or IPV6_COMPLIANCE for both 4 and 6
ip_behavior = "IPV6_COMPLIANCE"

origin_hostname = "backend-ew.lakhanis.net"
# variable edge_hostname reflects the Akamai Edge Hostname you want to use, ending in *.akamaized.net, *.edgesuite.net or *.edgekey.net.
edgeHostname = "ew.lakhanis.net.edgekey.net"
# Required only when creating an Enhanced TLS edge hostname. This argument sets the certificate enrollment ID.
certificate = 143056
# variable cert_provisioning_type reflects which type of HTTPS SSL/TLS Certificate method you use with Akamai. This can be CPS_MANAGED for certificates managed in Certificate Provisioning System or DEFAULT for Secure By Default feature.
cert_provisioning_type = "CPS_MANAGED"
# variable rule_format reflects the Akamai Property Manager rule format which includes updated behaviors for newer versions. 'latest' is accepted.
rule_format = "latest"

cpcode_name = "ew.lakhanis.net"

configuration_name = "ew.lakhanis.net"

hostname = "ew.lakhanis.net"

contact = ["nlakhani@akamai.com"]
# variable group_name reflects the name of your group you want to store your config. Groups are part of an Akamai contract.
group_name = "" #"Akamai South East Asia SEA-V-434SAU2"
# variable contract_id reflects your Akamai Contract ID.
contract_id = ""
# For some data sources and resources, you need to retrieve the ID for the specific Akamai product you are using.
product_id = ""
# Version of the IP protocol to use: IPV4 for version 4 only, IPV6_PERFORMANCE for version 6 only, or IPV6_COMPLIANCE for both 4 and 6
ip_behavior = ""

origin_hostname = ""
# variable edge_hostname reflects the Akamai Edge Hostname you want to use, ending in *.akamaized.net, *.edgesuite.net or *.edgekey.net.
edgeHostname = ""
# Required only when creating an Enhanced TLS edge hostname. This argument sets the certificate enrollment ID.
certificate = 0
# variable cert_provisioning_type reflects which type of HTTPS SSL/TLS Certificate method you use with Akamai. This can be CPS_MANAGED for certificates managed in Certificate Provisioning System or DEFAULT for Secure By Default feature.
cert_provisioning_type = ""
# variable rule_format reflects the Akamai Property Manager rule format which includes updated behaviors for newer versions. 'latest' is accepted.
rule_format = ""

cpcode_name = ""

configuration_name = ""

hostname = ""

contact = ["test@akamai.com"]
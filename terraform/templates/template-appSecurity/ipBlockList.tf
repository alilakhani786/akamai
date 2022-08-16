# variable ipblock_list reflects an array of IP addresses that should be blocked from accessing your hostname.
variable "ipblock_list" {}

# variable ipblock_list_exceptions reflects an array of IP addresses that should be ALWAYS ALLOWED to access your hostname.
variable "ipblock_list_exceptions" {}

# resource to set IP addresses in the IPBLOCKLIST, REPLACE mode will always 100% fully update all entries.
resource "akamai_networklist_network_list" "IPBLOCKLIST" {
  name        = "IPBLOCKLIST-0"
  type        = "IP"
  description = "IPBLOCKLIST-0"
  list        = var.ipblock_list
  mode        = "REPLACE"
}

# resource to set IP addresses in the IPBLOCKLISTEXCEPTIONS, REPLACE mode will always 100% fully update all entries.
resource "akamai_networklist_network_list" "IPBLOCKLISTEXCEPTIONS" {
  name        = "IPBLOCKLISTEXCEPTIONS-0"
  type        = "IP"
  description = "IPBLOCKLISTEXCEPTIONS-0"
  list        = var.ipblock_list_exceptions
  mode        = "REPLACE"
}
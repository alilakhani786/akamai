# variable ipblock_list reflects an array of IP addresses that should be blocked from accessing your hostname.
variable "ipblock_list" {}

# variable ipblock_list_exceptions reflects an array of IP addresses that should be ALWAYS ALLOWED to access your hostname.
variable "ipblock_list_exceptions" {}

# resource to set IP addresses in the IPBLOCKLIST, REPLACE mode will always 100% fully update all entries.
resource "akamai_networklist_network_list" "IPBLOCKLIST" {
  name        = "IPBLOCKLIST"
  type        = "IP"
  description = "IPBLOCKLIST"
  list        = var.ipblock_list
  mode        = "REPLACE"
}

# resource to set IP addresses in the IPBLOCKLISTEXCEPTIONS, REPLACE mode will always 100% fully update all entries.
resource "akamai_networklist_network_list" "IPBLOCKLISTEXCEPTIONS" {
  name        = "IPBLOCKLISTEXCEPTIONS"
  type        = "IP"
  description = "IPBLOCKLISTEXCEPTIONS"
  list        = var.ipblock_list_exceptions
  mode        = "REPLACE"
}

/*
# resource to activate the Akamai Network List.
resource "akamai_networklist_activations" "activation_IPBLOCKLIST" {
  network_list_id     = akamai_networklist_network_list.IPBLOCKLIST.id
  network             = var.network
  notes               = var.activation_notes
  notification_emails = [var.email]
}

# resource to activate the Akamai Network List.
resource "akamai_networklist_activations" "activation_IPBLOCKLISTEXCEPTIONS" {
  network_list_id     = akamai_networklist_network_list.IPBLOCKLISTEXCEPTIONS.id
  network             = var.network
  notes               = var.activation_notes
  notification_emails = [var.email]
}
*/
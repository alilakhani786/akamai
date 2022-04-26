# variable ipblock_list reflects an array of IP addresses that should FULLY BYPASS ANY PROTECTION part of Akamai Application Security.
variable "securitybypass_list" {}

# resource to set IP addresses in the SECUITYBYPASSLIST, REPLACE mode will always 100% fully update all entries.
resource "akamai_networklist_network_list" "SECURITYBYPASSLIST" {
  name        = "SECURITYBYPASSLIST"
  type        = "IP"
  description = "SECURITYBYPASSLIST"
  list        = var.securitybypass_list
  mode        = "REPLACE"
}

/*
# resource to activate the Akamai Network List.
resource "akamai_networklist_activations" "activation_SECURITYBYPASSLIST" {
  network_list_id     = akamai_networklist_network_list.SECURITYBYPASSLIST.id
  network             = var.network
  notes               = var.activation_notes
  notification_emails = [var.email]
}
*/
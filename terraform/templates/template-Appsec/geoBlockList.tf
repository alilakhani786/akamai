
# variable geoblock_list reflects an array of countries in two digit formatting (US - NL etc.) that should be blocked from accessing your hostname.
variable "geoblock_list" {}

# resource to set GEOs in country codes in the GEOBLOCKLIST, REPLACE mode will always 100% fully update all entries.
resource "akamai_networklist_network_list" "GEOBLOCKLIST" {
  name        = "GEOBLOCKLIST"
  type        = "GEO"
  description = "GEOBLOCKLIST"
  list        = var.geoblock_list
  mode        = "REPLACE"
}

/*
# resource to activate the Akamai Network List.
resource "akamai_networklist_activations" "activation_GEOBLOCKLIST" {
  network_list_id     = akamai_networklist_network_list.GEOBLOCKLIST.id
  network             = var.network
  notes               = var.activation_notes
  notification_emails = [var.email]
}
*/

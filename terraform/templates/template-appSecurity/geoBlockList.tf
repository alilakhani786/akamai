# variable geoblock_list reflects an array of countries in two digit formatting (US - NL etc.) that should be blocked from accessing your hostname.
variable "geoblock_list" {}

# resource to set GEOs in country codes in the GEOBLOCKLIST, REPLACE mode will always 100% fully update all entries.
resource "akamai_networklist_network_list" "GEOBLOCKLIST" {
  name        = "AliGeoBlockList"
  type        = "GEO"
  description = "AliGeoBlockList created by Terraform"
  list        = var.geoblock_list
  mode        = "REPLACE"
}
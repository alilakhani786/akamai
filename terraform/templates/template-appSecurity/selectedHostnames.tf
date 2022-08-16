/* tuple issue hostname(s)
resource "akamai_appsec_selected_hostnames" "hostnames" {
  config_id = akamai_appsec_configuration.akamai_appsec.config_id
  hostnames = var.hostname
  mode      = "REPLACE"
}
*/

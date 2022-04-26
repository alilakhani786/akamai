/*
  Author: Noorali (Ali) Lakhani @ nlakhani@akamai.com
  Creation date: 03/03/2022
  Description: Onboarding Delivery Configuration Automation Project
*/

provider "akamai" {
  edgerc         = "~/.edgerc"
  config_section = var.edgerc_config_section
}
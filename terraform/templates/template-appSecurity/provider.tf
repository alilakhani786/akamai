/*
  Author: Noorali (Ali) Lakhani @ nlakhani@akamai.com
  Creation date: 10/08/22
  Description: Onboarding Application Security Configuration Automation Project
*/

provider "akamai" {
  edgerc         = "~/.edgerc"
  config_section = var.edgerc_config_section
}

terraform {
  required_providers {
    akamai = {
      source = "akamai/akamai"
    }
  }
  required_version = ">= 0.13"
}
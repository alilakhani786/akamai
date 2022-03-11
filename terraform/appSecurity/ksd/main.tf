/*
  Author: Noorali (Ali) Lakhani @ nlakhani@akamai.com
  Creation date: 03/03/2022
  Description: Onboarding Delivery Configuration Automation Project
*/

locals { }

data "akamai_group" "group" {
  group_name  = var.group_name
  contract_id = var.contract_id
}

data "akamai_contract" "contract" {
  group_name = var.group_name
}
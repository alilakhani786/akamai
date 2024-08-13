/*
  Author: Noorali (Ali) Lakhani @ nlakhani@akamai.com
  Creation date: 03/03/2022
  Purpose: Automate Onboarding Akamai Delivery Configuration 
  Repo: https://github.com/alilakhani786/akamai/tree/main/terraform

  main.tf is the entry point to terraform project
*/

provider "akamai" {
  edgerc         = "~/.edgerc"
  config_section = "sea"
}

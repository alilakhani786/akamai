
variable "edgerc_config_section" {}
variable "contract_id" {}
variable "group_name" {}
variable "hostname" {}
variable "configuration_name" {}
variable "configuration_description" {}
# variable policy_name reflects the name of your Security Policy that is part of you Akamai Application Security configuration.
variable "policy_name" {}

# variable policy_prefix reflects a four digit alphanummerical prefix for your Security Policy.
variable "policy_prefix" {}

# variable activation_notes reflects the activation notes for your Akamai Application Security configuration version. Required to deploy changes.
variable "activation_notes" {}

# variable network reflects Akamai STAGING or Akamai PRODUCTION.
variable "network" {}

# variable email reflects the email address to receive activation emails on.
variable "email" {}


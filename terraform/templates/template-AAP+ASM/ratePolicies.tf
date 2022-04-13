
# the following variables reflect the ACTION for each of the Rate Policies, Slow POST Protection. Can be set to ALERT, DENY or NONE.
variable "ratepolicy_page_view_requests_action" {}
variable "ratepolicy_origin_error_action" {}
variable "ratepolicy_post_requests_action" {}
variable "slow_post_protection_action" {}

# resource to create Page View Requests Rate Policy which trigger based on amount of page views.
resource "akamai_appsec_rate_policy" "rate_policy_page_view_requests" {
  config_id   = akamai_appsec_configuration.akamai_appsec.config_id
  rate_policy = file("${path.module}/appsec-snippets/rate-policies/rate_policy_page_view_requests.json")
}

resource "akamai_appsec_rate_policy_action" "appsec_rate_policy_page_view_requests_action" {
  config_id          = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id = akamai_appsec_security_policy.security_policy.security_policy_id
  rate_policy_id     = akamai_appsec_rate_policy.rate_policy_page_view_requests.rate_policy_id
  ipv4_action        = var.ratepolicy_page_view_requests_action
  ipv6_action        = var.ratepolicy_page_view_requests_action
}

# resource to create Origin error Rate Policy which trigger based on amount of origin errors.
resource "akamai_appsec_rate_policy" "rate_policy_origin_error" {
  config_id   = akamai_appsec_configuration.akamai_appsec.config_id
  rate_policy = file("${path.module}/appsec-snippets/rate-policies/rate_policy_origin_error.json")
}

resource "akamai_appsec_rate_policy_action" "appsec_rate_policy_origin_error_action" {
  config_id          = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id = akamai_appsec_security_policy.security_policy.security_policy_id
  rate_policy_id     = akamai_appsec_rate_policy.rate_policy_origin_error.rate_policy_id
  ipv4_action        = var.ratepolicy_origin_error_action
  ipv6_action        = var.ratepolicy_origin_error_action
}

# resource to create POST Requests Rate Policy which trigger based on amount of POST requests.
resource "akamai_appsec_rate_policy" "rate_policy_post_requests" {
  config_id   = akamai_appsec_configuration.akamai_appsec.config_id
  rate_policy = file("${path.module}/appsec-snippets/rate-policies/rate_policy_post_requests.json")
}

resource "akamai_appsec_rate_policy_action" "appsec_rate_policy_post_requests_action" {
  config_id          = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id = akamai_appsec_security_policy.security_policy.security_policy_id
  rate_policy_id     = akamai_appsec_rate_policy.rate_policy_post_requests.rate_policy_id
  ipv4_action        = var.ratepolicy_post_requests_action
  ipv6_action        = var.ratepolicy_post_requests_action
}

# resource to set the SLOW POST Protection to best practice standards.
resource "akamai_appsec_slow_post" "slow_post" {
  config_id                  = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id         = akamai_appsec_security_policy.security_policy.security_policy_id
  slow_rate_action           = var.slow_post_protection_action
  slow_rate_threshold_rate   = 10
  slow_rate_threshold_period = 60
}

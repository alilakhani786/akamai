resource "akamai_appsec_advanced_settings_logging" "logging" {
  config_id = akamai_appsec_configuration.akamai_appsec.config_id
  logging = jsonencode(
    {
      "allowSampling" : true,
      "cookies" : {
        "type" : "all"
      },
      "customHeaders" : {
        "type" : "all"
      },
      "standardHeaders" : {
        "type" : "all"
      }
    }
  )
}

resource "akamai_appsec_advanced_settings_prefetch" "prefetch" {
  config_id            = akamai_appsec_configuration.akamai_appsec.config_id
  enable_app_layer     = true
  all_extensions       = false
  enable_rate_controls = false
  extensions           = ["cgi", "jsp", "aspx", "EMPTY_STRING", "php", "py", "asp"]
}

resource "akamai_appsec_advanced_settings_pragma_header" "pragma_header" {
  config_id = akamai_appsec_configuration.akamai_appsec.config_id
  #security_policy_id = data.akamai_appsec_security_policy.specific_security_policy.security_policy_id
  pragma_header = jsonencode(
    {
      "action" : "REMOVE",
      "conditionOperator" : "AND",
      "excludeCondition" : [
        {
          "type" : "queryParamNameValueMatch",
          "positiveMatch" : true,
          "header" : "",
          "value" : [
            "true"
          ],
          "name" : "ENABLEDEBUG",
          "valueCase" : false,
          "valueWildcard" : false,
          "useHeaders" : false
        }
      ]
    }
  )
}
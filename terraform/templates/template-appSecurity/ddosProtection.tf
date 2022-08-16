resource "akamai_appsec_rate_policy" "post_page_requests_tf" {
  config_id = akamai_appsec_configuration.akamai_appsec.config_id
  rate_policy = jsonencode(
    {
      "additionalMatchOptions" : [
        {
          "positiveMatch" : true,
          "type" : "RequestMethodCondition",
          "values" : [
            "POST"
          ]
        }
      ],
      "averageThreshold" : 3,
      "burstThreshold" : 5,
      "clientIdentifier" : "ip",
      "description" : "Mitigating HTTP flood attacks using POST requests",
      "matchType" : "path",
      "name" : "POST Page Requests TF",
      "pathMatchType" : "Custom",
      "pathUriPositiveMatch" : true,
      "requestType" : "ClientRequest",
      "sameActionOnIpv6" : true,
      "type" : "WAF",
      "useXForwardForHeaders" : false
    }
  )
}

resource "akamai_appsec_rate_policy" "page_view_requests_tf" {
  config_id = akamai_appsec_configuration.akamai_appsec.config_id
  rate_policy = jsonencode(
    {
      "additionalMatchOptions" : [
        {
          "positiveMatch" : true,
          "type" : "RequestMethodCondition",
          "values" : [
            "GET",
            "HEAD"
          ]
        }
      ],
      "averageThreshold" : 12,
      "burstThreshold" : 18,
      "clientIdentifier" : "ip",
      "description" : "A popular brute force attack that consists of sending a large number of requests for base page, HTML page or XHR requests (usually non-cacheable). This could destabilize the origin.",
      "fileExtensions" : {
        "positiveMatch" : false,
        "values" : [
          "aif",
          "aiff",
          "au",
          "avi",
          "bin",
          "bmp",
          "cab",
          "carb",
          "cct",
          "cdf",
          "class",
          "css",
          "doc",
          "dcr",
          "dtd",
          "exe",
          "flv",
          "gcf",
          "gff",
          "gif",
          "grv",
          "hdml",
          "hqx",
          "ico",
          "ini",
          "jpeg",
          "jpg",
          "js",
          "mov",
          "mp3",
          "nc",
          "pct",
          "pdf",
          "png",
          "ppc",
          "pws",
          "svg",
          "swa",
          "swf",
          "txt",
          "vbs",
          "w32",
          "wav",
          "wbmp",
          "wml",
          "wmlc",
          "wmls",
          "wmlsc",
          "xsd",
          "zip",
          "webp",
          "jxr",
          "hdp",
          "wdp",
          "webm",
          "ogv",
          "mp4",
          "ttf",
          "woff",
          "eot",
          "woff2"
        ]
      },
      "matchType" : "path",
      "name" : "Page View Requests TF",
      "pathMatchType" : "Custom",
      "pathUriPositiveMatch" : true,
      "requestType" : "ClientRequest",
      "sameActionOnIpv6" : true,
      "type" : "WAF",
      "useXForwardForHeaders" : false
    }
  )
}

// Rate Policy Actions
resource "akamai_appsec_rate_policy_action" "post_page_requests_tf" {
  config_id          = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id = akamai_appsec_security_policy.security_policy.security_policy_id
  rate_policy_id     = akamai_appsec_rate_policy.post_page_requests_tf.rate_policy_id
  ipv4_action        = "alert"
  ipv6_action        = "alert"
}

resource "akamai_appsec_rate_policy_action" "page_view_requests_tf" {
  config_id          = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id = akamai_appsec_security_policy.security_policy.security_policy_id
  rate_policy_id     = akamai_appsec_rate_policy.page_view_requests_tf.rate_policy_id
  ipv4_action        = "alert"
  ipv6_action        = "alert"
}

// Slow Post Protection
resource "akamai_appsec_slow_post" "slow_post" {
  config_id                  = akamai_appsec_configuration.akamai_appsec.config_id
  security_policy_id         = akamai_appsec_security_policy.security_policy.security_policy_id
  slow_rate_action           = "alert"
  slow_rate_threshold_rate   = 10
  slow_rate_threshold_period = 60
}


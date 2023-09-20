
resource "volterra_origin_pool" "origin" {
  name      = "${var.name}-origin"
  namespace = var.namespace

  endpoint_selection     = "LOCAL_PREFERRED"
  loadbalancer_algorithm = "LB_OVERRIDE"

  origin_servers {

    public_name {
      dns_name = "coleman.myedgedemo.com"
    }

    labels = {
      "key1" = "value1"
    }
  }
  port = 443

  use_tls {
    use_host_header_as_sni = true
    tls_config {
      default_security = true
    }
    skip_server_verification = true
    no_mtls                  = true
  }
}

resource "random_pet" "loadbalancer" {
  count  = var.lb_count
  length = 2
}

resource "volterra_http_loadbalancer" "appProxy" {
  count     = var.lb_count
  name      = "${var.name}-${random_pet.loadbalancer[count.index].id}-http-lb"
  namespace = var.namespace

  advertise_on_public_default_vip = true
  disable_api_definition          = true
  no_challenge                    = true
  disable_ddos_detection          = true

  #domains = ["${var.name}.${var.delegated_dns_domain}"]
  domains = ["${random_pet.loadbalancer[count.index].id}.${var.delegated_dns_domain}"]

  #round_robin = true
  source_ip_stickiness = true

  http {
    dns_volterra_managed = true
    port                 = "80"
  }

  enable_malicious_user_detection = true
  service_policies_from_namespace = true
  disable_trust_client_ip_headers = true
  user_id_client_ip               = true

  app_firewall {
    name      = "${var.name}-waap"
    namespace = var.namespace
  }

  enable_api_discovery {
    enable_learn_from_redirect_traffic = true
  }


  api_rate_limit {
    no_ip_allowed_list = true
  }
  enable_ip_reputation {
    ip_threat_categories = ["SPAM_SOURCES"]
  }

  data_guard_rules {
    metadata {
      name    = "default-rule"
      disable = false
    }
    apply_data_guard = true
    any_domain       = true
    path {
      prefix = "/"
    }
  }

  client_side_defense {
    policy {
      js_insert_all_pages = true
    }
  }

  cors_policy {
    allow_origin = [
      "raw.githubusercontent.com"
    ]
    allow_origin_regex = []
    allow_methods      = "GET"
  }
  bot_defense {
    regional_endpoint = "US"
    policy {
      protected_app_endpoints {
        metadata {
          name    = "login"
          disable = false
        }
        http_methods = ["METHOD_POST"]
        flow_label {
          authentication {
            login {
              disable_transaction_result = true
            }
          }
        }
        protocol   = "BOTH"
        any_domain = true
        path {
          prefix = "/login/"
        }
        web = true
        mitigation {
          block {
            status = "OK"
            body   = "string:///VGhlIHJlcXVlc3RlZCBVUkwgd2FzIHJlamVjdGVkLiBQbGVhc2UgY29uc3VsdCB3aXRoIHlvdXIgYWRtaW5pc3RyYXRvci4="
          }
        }
      }
      protected_app_endpoints {
        metadata {
          name    = "web-scraping"
          disable = false
        }
        http_methods = ["METHOD_GET_DOCUMENT"]
        flow_label {
          search {
            product_search = true
          }
        }
        protocol   = "BOTH"
        any_domain = true
        path {
          prefix = "/"
        }
        web = true
        mitigation {
          block {
            status = "OK"
            body   = "string:///VGhlIHJlcXVlc3RlZCBVUkwgd2FzIHJlamVjdGVkLCBCb3QhIFBsZWFzZSBjb25zdWx0IHdpdGggeW91ciBhZG1pbmlzdHJhdG9yLg=="
          }
        }
      }
      js_insert_all_pages {
        javascript_location = "AFTER_HEAD"
      }
      js_download_path   = "/common.js"
      disable_mobile_sdk = true
    }
    timeout = "1000"
  }

  more_option {
    request_headers_to_add {
      name   = "geo-country"
      value  = "$[geoip_country]"
      append = false
    }
    request_headers_to_add {
      name   = "Access-Control-Allow-Origin"
      value  = "*"
      append = false
    }
  }

 routes {
    simple_route {
      http_method = "ANY"
      path {
        prefix = "/en-us/"
      }
      origin_pools {
        pool {
          namespace = var.namespace
          name      = volterra_origin_pool.origin.name
        }
        weight   = 1
        priority = 1
      }
    }
  }
  routes {
    simple_route {
      http_method = "ANY"
      path {
        prefix = "/es/"
      }
      origin_pools {
        pool {
          namespace = var.namespace
          name      = volterra_origin_pool.origin.name
        }
        weight   = 1
        priority = 1
      }
    }
  }
  routes {
    simple_route {
      http_method = "ANY"
      path {
        prefix = "/fr/"
      }
      origin_pools {
        pool {
          namespace = var.namespace
          name      = volterra_origin_pool.origin.name
        }
        weight   = 1
        priority = 1
      }
    }
  }
  routes {
    simple_route {
      http_method = "ANY"
      path {
        prefix = "/pt/"
      }
      origin_pools {
        pool {
          namespace = var.namespace
          name      = volterra_origin_pool.origin.name
        }
        weight   = 1
        priority = 1
      }
    }
  }
}
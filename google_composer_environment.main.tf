resource "google_composer_environment" "main" {
  name   = var.name
  region = var.region

  config {
    encryption_config {
      kms_key_name = var.kms_key_name
    }

    private_environment_config {
      enable_private_endpoint = true
    }

    web_server_network_access_control {
      allowed_ip_range {
        value       = var.web_server_allowed_ip_range
        description = var.web_server_allowed_ip_description
      }
    }

    recovery_config {
      scheduled_snapshots_config {
        enabled = true
      }
    }

    node_config {
      network         = var.network
      subnetwork      = var.subnetwork
      service_account = google_service_account.composer.email
    }
  }
}


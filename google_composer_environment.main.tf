resource "google_composer_environment" "main" {
  name   = var.name
  region = var.region

  depends_on = [
    google_kms_crypto_key_iam_member.composer,
    google_service_account_iam_member.composer_service_account_user
  ]

  config {
    encryption_config {
      kms_key_name = var.kms_key_name
    }

    private_environment_config {
      enable_private_endpoint = true
    }

    software_config {
      image_version = var.image_version
    }

    maintenance_window {
      start_time = var.maintenance_window_start_time
      end_time   = var.maintenance_window_end_time
      recurrence = var.maintenance_window_recurrence
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

resource "google_kms_crypto_key_iam_member" "composer" {
  crypto_key_id = var.kms_key_name
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:service-${var.project_number}@cloudcomposer-accounts.iam.gserviceaccount.com"
}

resource "google_service_account_iam_member" "composer_service_account_user" {
  service_account_id = google_service_account.composer.name
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:service-${var.project_number}@cloudcomposer-accounts.iam.gserviceaccount.com"
}

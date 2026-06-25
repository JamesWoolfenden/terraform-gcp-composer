resource "google_composer_environment" "main" {
  name   = var.name
  region = "europe-west2"

  config {
    encryption_config {
      kms_key_name = var.kms_key_name
    }

    private_environment_config {
      enable_private_endpoint = true
    }

    recovery_config {
      scheduled_snapshots_config {
        enabled = true
      }
    }

    node_config {
      network    = var.network
      subnetwork = var.subnetwork
    }
  }
}

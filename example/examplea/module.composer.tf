# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "composer" {
  source       = "../../"
  name         = "example-environment"
  kms_key_name = google_kms_crypto_key.main.id
  network      = google_compute_network.private.self_link
  subnetwork   = google_compute_subnetwork.environment.self_link
}

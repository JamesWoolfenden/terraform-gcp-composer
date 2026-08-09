# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "composer" {
  source                            = "../../"
  name                              = "example-environment"
  region                            = "europe-west2"
  kms_key_name                      = google_kms_crypto_key.main.id
  network                           = google_compute_network.private.self_link
  subnetwork                        = google_compute_subnetwork.environment.self_link
  project                           = google_compute_network.private.project
  web_server_allowed_ip_range       = "203.0.113.0/24"
  web_server_allowed_ip_description = "Example corp office range (RFC 5737 documentation range)"
}

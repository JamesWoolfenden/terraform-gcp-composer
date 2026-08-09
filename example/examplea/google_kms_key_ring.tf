resource "google_kms_key_ring" "main" {
  name     = "composer-keyring"
  location = "europe-west2"
}

resource "google_kms_crypto_key" "main" {
  name            = "composer-key"
  key_ring        = google_kms_key_ring.main.id
  rotation_period = "5400000s"

  lifecycle {
    prevent_destroy = true
  }
}

data "google_project" "current" {}

resource "google_kms_crypto_key_iam_member" "composer_cmek" {
  crypto_key_id = google_kms_crypto_key.main.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:service-${data.google_project.current.number}@cloudcomposer-accounts.iam.gserviceaccount.com"
}

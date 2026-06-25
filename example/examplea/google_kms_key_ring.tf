resource "google_kms_key_ring" "main" {
  name     = "composer-keyring"
  location = "europe-west2"
}

resource "google_kms_crypto_key" "main" {
  name     = "composer-key"
  key_ring = google_kms_key_ring.main.id

  lifecycle {
    prevent_destroy = true
  }
}

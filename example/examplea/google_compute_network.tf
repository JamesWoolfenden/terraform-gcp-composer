resource "google_compute_network" "private" {
  name                    = "composer-private"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "environment" {
  name                     = "composer-environment"
  ip_cidr_range            = "10.93.0.0/24"
  region                   = "europe-west2"
  network                  = google_compute_network.private.id
  private_ip_google_access = true
}

resource "google_service_account" "composer" {
  account_id   = "composer-${var.name}"
  display_name = "Service Account for the ${var.name} Managed Airflow Environment"
}

resource "google_project_iam_member" "composer_worker" {
  project = var.project
  role    = "roles/composer.worker"
  member  = "serviceAccount:${google_service_account.composer.email}"
}

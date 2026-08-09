resource "google_service_account" "composer" {
  account_id   = "composer-env-account"
  display_name = "Test Service Account for Managed Airflow Environment"
}

resource "google_project_iam_member" "composer_worker" {
  project = var.project
  role    = "roles/composer.worker"
  member  = "serviceAccount:${google_service_account.composer.email}"
}


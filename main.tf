provider "google" {
  project = var.project_id
  region  = "us-central1"
}

resource "google_bigquery_dataset" "analytics" {
  dataset_id  = var.dataset_id
  friendly_name = "Analytics Dataset"
  description = "Created via Jenkins + Terraform"
  location    = "US"

  labels = {
    managed_by = "jenkins"
    environment = "prod"
  }
}

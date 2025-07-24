provider "google" {
  project     = var.project_id
  region      = "us-central1"
  credentials = file(var.gcp_credentials_file)
}

resource "google_bigquery_dataset" "my_dataset" {
  dataset_id    = var.dataset_id
  location      = "US"
  friendly_name = "Analytics Data"
}

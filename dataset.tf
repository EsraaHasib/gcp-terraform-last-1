resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "my_dataset"
  friendly_name               = "dataset1"
  description                 = "This is a test description"
  location                    = "EU"
  default_table_expiration_ms = 3600000
}
resource "google_storage_bucket" "bucket1" {
  name          = "my-bucket-321408"
  location      = "EU"
  force_destroy = true
  uniform_bucket_level_access = true
}
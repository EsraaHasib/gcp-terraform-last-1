resource "google_project_service" "api" {
  project = "my-second-project-321408"
  service = "iam.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}
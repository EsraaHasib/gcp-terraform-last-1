resource "google_service_account" "service_account" {
  account_id   = "my-second-project-321408"
  display_name = "Service Account1"
  
}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/compute.instanceAdmin"
    members = [
      "user:esraahasib6@gmail.com",
    ]  
  }
}

resource "google_compute_instance_iam_policy" "policy" {
  project = google_compute_instance.publicvm.project
  zone = google_compute_instance.publicvm.zone
  instance_name = google_compute_instance.publicvm.name
  policy_data = data.google_iam_policy.admin.policy_data
}

#resource "google_service_account_iam_binding" "admin-account-iam" {
  #service_account_id = google_service_account.service_account.name
  #role               = "roles/iam.serviceAccountAdmin"
  #members = [
    #"user:esraahasib6@gmail.com",
 # ]
#} 





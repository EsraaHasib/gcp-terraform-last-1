resource "google_container_cluster" "cluster1" {
  name     = "my-cluster"
  location = "us-central1"
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.cluster1.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    service_account = google_service_account.service_account.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}



# resource "google_container_cluster" "cluster1" {
#   name               = "cluster1"
#   location           = "us-central1"
#   initial_node_count = 3
#   network = google_compute_network.vpc.id
#   node_config {
#     machine_type = "e2.micro"
#     image_type = "ubuntu"
#   }
#   timeouts {
#     create = "30m"
#     update = "40m"
#   }
# }

##### VPC ####
resource "google_compute_network" "vpc" {
  name                    = "vpc2subs"
  auto_create_subnetworks = false
}

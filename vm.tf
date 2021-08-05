######### Public VM ####
resource "google_compute_instance" "publicvm" {
  name         = "publicvm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      size = 10
      type  = "pd-standard"
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc.name
    network_ip = "10.0.1.3"
    subnetwork =google_compute_subnetwork.subnet1.name
    



    # access_config {
    #   nat_ip = google_compute_address.external_with_subnet_and_address.address
    # }
 }
}
 
# resource "google_compute_address" "external_with_subnet_and_address" {
#   name         = "my-external-address"
#   subnetwork   = google_compute_subnetwork.subnet1.id
#   address      = "192.168.3.0/16"
#   region       = "europe-west-1"
# }

########### PRIVATE INSTANCE ##########
resource "google_compute_instance" "privatevm" {
  name         = "privatevm"
  machine_type = "e2-medium"
  zone         = "us-west1-b"
  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      size = 10
      type  = "pd-standard"
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = google_compute_network.vpc.name
    network_ip = "10.0.2.3" 
    subnetwork =google_compute_subnetwork.subnet2.name
    # access_config {
    #   nat_ip = google_compute_address.internal_with_subnet_and_address.address
    # }
    } 
} 

# resource "google_compute_address" "internal_with_subnet_and_address" {
#   name         = "my-external-address"
#   subnetwork   = google_compute_subnetwork.subnet2.id
#   address_type = "INTERNAL"
#   address      = "192.168.4.0/16"
#   region       = "us-central1-a"
# }
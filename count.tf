variable "project" {}

variable "region" {
    default =    "us-central1"
}

variable "zone"{
    default = "us-central1-b"
}
variable "machine_type"{
    default = "n1-standard-1"
}
variable "name"{}

variable "image" {
    default = "projects/debian-cloud/global/images/debian-12-bookworm-v20260210"
}
variable "network" {
  type     = string
  default  = "default"
}

resource "google_compute_instance" "default" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project
  count        = 3


  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  
# Define the network interface using the "default" network
  network_interface {
    network = var.network
    # Assign an ephemeral public IP
    access_config {
    }
  }
}

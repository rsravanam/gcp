variable environment {}
// Providing credentials

provider "google" {
    credentials = "${file("${var.gcp_credentials_file}")}"
    project     = "${var.gcp_project_id}"
    region      = "${var.region}"
}

resource "google_compute_network" "newvpc" {
  name                    = "swat-vpc"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "default-us-east1" {
  name          = "${var.environment}-swat-subnet-us-east1"
  ip_cidr_range = "10.0.0.0/16"
  network       = "${google_compute_network.newvpc.self_link}"
  region        = "us-east1"
}

resource "google_compute_subnetwork" "default-us-central1" {
  name          = "${var.environment}-swat-subnet-us-central1"
  ip_cidr_range = "10.1.0.0/16"
  network       = "${google_compute_network.newvpc.self_link}"
  region        = "us-central1"
}

resource "google_compute_route" "dev-route" {
  name             = "${var.environment}-network-route"
  dest_range       = "0.0.0.0/0"
  network          = "${google_compute_network.newvpc.name}"
  next_hop_gateway = "default-internet-gateway"
  priority         = 100
}

resource "google_compute_firewall" "swat-firewall" {
  name    = "swat-firewall"
  network = "${google_compute_network.newvpc.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_tags = ["web"]
}
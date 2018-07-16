// GCP Credentials Variables

variable gcp_credentials_file {}
variable gcp_project_id {}
variable gcp_region {}
variable gcp_org_id {}

// Providing credentials
provider "google" {
    credentials = "${file("${var.gcp_credentials_file}")}"
    project     = "${var.gcp_project_id}"
    region      = "${var.gcp_region}"
}

// Billing Account
data "google_billing_account" "acct" {
  display_name = "JARSH Billing Account"
  open         = true
}

resource "google_project" "my_project" {
  name       = "Pilot POC Project"
  project_id = "${var.gcp_project_id}"
  org_id     = "${var.gcp_org_id}"

  billing_account = "${data.google_billing_account.acct.id}"
}


// Provision instance
resource "google_compute_instance" "default" {
  name         = "terraform-test-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["test", "test"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-8"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata {
    test = "test"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["userinfo-email", "compute-rw", "storage-ro"]
  }
}
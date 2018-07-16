// GCP Credentials
provider "google" {
    credentials = "${file("D:\TF\TF_GCP\gcp_credentials_file\gcp-creds-json-file.json")}"
    project     = "gcp-project-id"
    region      = "us-central1"
}

resource "google_compute_instance" "default" {
  name         = "test"
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
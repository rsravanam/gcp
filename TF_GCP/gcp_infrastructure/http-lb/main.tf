// GCP Credentials Variables

// variable gcp_credentials_file {}
// variable gcp_project_id {}
// variable gcp_region {}
variable environment {}
// Providing credentials

provider "google" {
    credentials = "${file("${var.gcp_credentials_file}")}"
    project     = "${var.gcp_project_id}"
    region      = "${var.region}"
}

resource "google_compute_instance_template" "instance-template" {
  name           = "${var.environment}-instance-template"
  machine_type   = "${var.gcp_machine_type}"
  can_ip_forward = false

  // tags = ["foo", "bar"]

  disk {
    source_image = "${var.gcp_machine_image}"
  }

  network_interface {
    network = "${var.gcp_vpc_network}"
  }

  //metadata {
  //  foo = "bar"
  //}

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

resource "google_compute_target_pool" "targetpool" {
  name = "${var.environment}-target-pool"
}

resource "google_compute_region_instance_group_manager" "igm" {
  name   = "${var.environment}-igm"
  region = "${var.region}"

  instance_template  = "${google_compute_instance_template.instance-template.self_link}"
  target_pools       = ["${google_compute_target_pool.targetpool.self_link}"]
  base_instance_name = "${var.environment}-instance"
}

resource "google_compute_region_autoscaler" "autoscaler" {
  name   = "${var.environment}-autoscaler"
  region = "${var.region}"
  target = "${google_compute_region_instance_group_manager.igm.self_link}"

  autoscaling_policy = {
    max_replicas    = 5
    min_replicas    = 1
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}
variable "region" {
  default = "us-central1"
}

variable "gcp_credentials_file" {
  default = "gcp-creds-json-file.json"
}

variable "gcp_project_id" {
  default = "gcp_project_id"
}

variable "gcp_machine_type" {
  default = "n1-standard-1"
}

variable "gcp_machine_image" {
  default = "debian-cloud/debian-8"
}

variable "gcp_vpc_network" {
  default = "default"
}

variable "environment" {
  default = "dev"
}
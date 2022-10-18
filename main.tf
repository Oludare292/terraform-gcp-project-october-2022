
terraform {
  backend "gcs" {
    bucket  = "state-store-123"
    prefix  = ""
  }
}

resource "google_compute_instance" "nginx_test" {
  name         = "test-nginx-1"
  project = var.project_id
  machine_type = "n1-standard-1"
  zone         = "us-east4-c"

  tags = ["http-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = "sudo apt-get update;sudo apt install nginx -y"
}
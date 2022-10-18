resource "google_compute_firewall" "rules" {
  project     = var.project_id
  name        = "default-allow-http"
  network     = "default"
  description = "Creates firewall rule to allow http traffic"

  allow {
    protocol  = "tcp"
    ports     = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}
output "instance_ip_addr" {
  value = format("%s%s","http://",google_compute_instance.nginx_test.network_interface[0].access_config[0].nat_ip)
}
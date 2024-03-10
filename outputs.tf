### OUTPUTS ###
output "subnet-gateway" {
    value = google_compute_subnetwork.subnet-1.gateway_address
}

output "nginx-public-ip" {
    value = google_compute_instance.nginx_instance.network_interface[0].access_config[0].nat_ip
}

output "webserver-ips" {
    value = module.webservers.webserver-ips
}

output "db-private-ip" {
    value = google_compute_instance.mysqldb.network_interface[0].network_ip
}

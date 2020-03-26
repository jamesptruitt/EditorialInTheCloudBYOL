output "virtual_machine_ids" {
  value = "${module.media_central_servers.vm_ids}"
}

output "virtual_machine_private_ips" {
  value = "${module.media_central_servers.network_interface_private_ip}"
}

output "virtual_machine_public_ips" {
  value = "${module.media_central_servers.public_ip_address}"
}

output "virtual_machine_public_ip_dns_name" {
  value = "${module.media_central_servers.public_ip_dns_name}"
}
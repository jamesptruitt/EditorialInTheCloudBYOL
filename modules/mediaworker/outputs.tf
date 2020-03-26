output "virtual_machine_ids" {
  value = "${module.media_worker.vm_ids}"
}

output "virtual_machine_private_ips" {
  value = "${module.media_worker.network_interface_private_ip}"
}

output "virtual_machine_public_ips" {
  value = "${module.media_worker.public_ip_address}"
}

output "virtual_machine_public_ip_dns_name" {
  value = "${module.media_worker.public_ip_dns_name}"
}
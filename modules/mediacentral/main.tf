locals{
}

module "media_central_servers" {
  source                          = "../azurevm"
  resource_group_name             = var.resource_group_name
  location                        = var.resource_group_location
  vm_hostname                     = var.hostname
  admin_password                  = var.admin_password
  admin_username                  = var.admin_username
  public_ip_dns                   = var.media_central_vm_public_ip_dns
  nb_public_ip                    = var.media_central_vm_number_public_ip
  remote_port                     = var.media_central_vm_remote_port
  nb_instances                    = var.media_central_vm_instances
  vm_os_simple                    = "CentOS"
  vm_size                         = var.media_central_vm_size
  vnet_subnet_id                  = var.subnet_id
  boot_diagnostics                = "false"
  delete_os_disk_on_termination   = "true"
  data_disk                       = "true"
  data_disk_size_gb               = "128"
  data_sa_type                    = "Premium_LRS"
  hide_suffix                     = "true"
  tags                            = var.tags
}

locals{
  media_central_vm_script_url   = "https://raw.githubusercontent.com/jamesptruitt/EditorialInTheCloudBYOL/master/scripts/installMediaCentral.bash"
  media_central_vm_script_name  = "installMediaCentral.bash"
}

module "media_central_servers" {
  source                          = "../azurelinuxvm"
  resource_group_name             = var.resource_group_name
  location                        = var.resource_group_location
  vm_hostname                     = var.hostname
  admin_password                  = var.admin_password
  admin_username                  = var.admin_username
  nb_public_ip                    = var.media_central_vm_number_public_ip
  remote_port                     = var.media_central_vm_remote_port
  base_index                      = var.base_index
  nb_instances                    = var.media_central_vm_instances
  vm_os_simple                    = var.media_central_vm_os_simple
  vm_os_id                        = var.media_central_vm_os_id
  vm_size                         = var.media_central_vm_size
  vnet_subnet_id                  = var.subnet_id
  boot_diagnostics                = "false"
  delete_os_disk_on_termination   = "true"
  data_disk                       = "true"
  data_disk_size_gb               = "1024"
  data_sa_type                    = "Premium_LRS"
  hide_suffix                     = "true"
  tags                            = var.tags
}

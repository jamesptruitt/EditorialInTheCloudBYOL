locals {
  
}

###################################
# Window VM(s) for Media Composer #
###################################
module "media_composer" {
  source                          = "../azurewindowsvm"
  resource_group_name             = var.resource_group_name
  location                        = var.resource_group_location
  vm_hostname                     = var.hostname
  admin_password                  = var.admin_password
  admin_username                  = var.admin_username
  base_index                      = var.base_index
  vm_os_simple                    = var.mediacomposer_vm_os_simple
  vm_os_id                        = var.mediacomposer_vm_os_id
  storage_account_type            = "Standard_LRS"
  nb_public_ip                    = var.mediacomposer_vm_number_public_ip
  remote_port                     = var.mediacomposer_vm_remote_port
  nb_instances                    = var.mediacomposer_vm_instances
  vm_size                         = var.mediacomposer_vm_size
  vnet_subnet_id                  = var.subnet_id
  boot_diagnostics                = "false"
  delete_os_disk_on_termination   = "true"
  enable_accelerated_networking   = "false"
  is_windows_image                = "true"
  tags                            = var.tags
}

locals {
}

#################################
# Window VM(s) for Mediaworkers #
#################################
module "media_worker" {
  source                          = "../azurewindowsvm"
  resource_group_name             = var.resource_group_name
  location                        = var.resource_group_location
  vm_hostname                     = var.hostname
  admin_password                  = var.admin_password
  admin_username                  = var.admin_username
  vm_os_simple                    = var.mediaworker_vm_os_simple
  vm_os_id                        = var.mediaworker_vm_os_id
  nb_public_ip                    = var.mediaworker_vm_number_public_ip
  remote_port                     = var.mediaworker_vm_remote_port
  base_index                      = var.base_index
  nb_instances                    = var.mediaworker_vm_instances
  vm_size                         = var.mediaworker_vm_size
  vnet_subnet_id                  = var.subnet_id
  boot_diagnostics                = "false"
  delete_os_disk_on_termination   = "true"
  enable_accelerated_networking   = "true"
  is_windows_image                = "true"
  tags                            = var.tags
}

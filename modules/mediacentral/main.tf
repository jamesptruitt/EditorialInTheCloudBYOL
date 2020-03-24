locals{
  media_central_vm_script_url   = "https://raw.githubusercontent.com/jamesptruitt/EditorialInTheCloudBYOL/master/scripts/installMediaCentral.bash"
  media_central_vm_script_name  = "installMediaCentral.bash"
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

resource "azurerm_virtual_machine_extension" "media_central_servers" {
  name                  = var.hostname
  count                 = var.media_central_vm_instances
  virtual_machine_name  = var.hostname
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  publisher             = "Microsoft.Azure.Extensions"
  type                  = "CustomScript"
  type_handler_version  = "2.0"
  depends_on            = [module.media_central_servers]
  tags                  = var.tags

  # CustomVMExtension Documetnation: https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-windows
  settings = <<EOF
    {     
       "commandToExecute": "echo ${var.admin_password} | sudo sh -c 'echo root:root | chpasswd' && wget '${local.media_central_vm_script_url}' -O ${local.media_central_vm_script_name} && echo root | sudo -S /bin/bash ${local.media_central_vm_script_name}" 
    }
  EOF
}
/*
resource "azurerm_virtual_machine_extension" "media_central_servers" {
  name                  = var.hostname
  count                 = var.media_central_vm_instances
  virtual_machine_name  = var.hostname
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  publisher             = "Microsoft.Azure.Extensions"
  type                  = "CustomScript"
  type_handler_version  = "2.0"
  depends_on            = [module.media_central_servers]
  tags                  = var.tags

  # CustomVMExtension Documetnation: https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-windows
 # "commandToExecute": "echo ${var.admin_password} | sudo sh -c 'echo root:${var.admin_password} | chpasswd' && echo ${var.admin_password} | su && wget 'https://devterraforminstalls.blob.core.windows.net/installers/mediacentral_platform_2019.9.5.iso' -O mediacentral_platform_2019.9.5.iso"
  settings = <<EOF
    {     
       "commandToExecute": "wget '${local.media_central_vm_script_url}' -O ${local.media_central_vm_script_name}" 
    }
  EOF
}
*/

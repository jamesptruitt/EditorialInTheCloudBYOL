locals {

}

###################################
# Window VM(s) for Media Composer #
###################################
module "media_composer" {
  source                          = "../azurevm"
  resource_group_name             = var.resource_group_name
  location                        = var.resource_group_location
  vm_hostname                     = var.hostname
  admin_password                  = var.admin_password
  admin_username                  = var.admin_username
  vm_os_simple                    = "WindowsServer"
  public_ip_dns                   = var.mediacomposer_vm_public_ip_dns
  nb_public_ip                    = var.mediacomposer_vm_number_public_ip
  remote_port                     = var.mediacomposer_vm_remote_port
  nb_instances                    = var.mediacomposer_vm_instances
  vm_size                         = var.mediacomposer_vm_size
  vnet_subnet_id                  = var.subnet_id
  boot_diagnostics                = "false"
  delete_os_disk_on_termination   = "true"
  enable_accelerated_networking   = "true"
  is_windows_image                = "true"
  tags                            = var.tags

}
/*
resource "azurerm_virtual_machine_extension" "media_worker_gpu" {
  name                  = format("${var.hostname}-%02.0f",count.index)
  count                 = var.mediacomposer_vm_instances
  virtual_machine_name  = format("${var.hostname}-%02.0f",count.index)
  resource_group_name   = var.resource_group_name
  location              = var.resource_group_location
  publisher             = "Microsoft.Compute"
  type                  = "CustomScriptExtension"
  type_handler_version  = "1.9"
  depends_on            = [module.media_composer]
  tags                  = var.tags

  # CustomVMExtension Documetnation: https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-windows
  settings = <<SETTINGS
    {

    }
SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
    {
      "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted Set-AzVMExtension
    -ResourceGroupName "myResourceGroup" `
    -VMName "${format("${var.hostname}-%02.0f",count.index)}" `
    -Location "${var.resource_group_location}" `
    -Publisher "Microsoft.HpcCompute" `
    -ExtensionName "NvidiaGpuDriverWindows" `
    -ExtensionType "NvidiaGpuDriverWindows" `
    -TypeHandlerVersion 1.2 `
    -SettingString '{ `
	}'"
    }
  PROTECTED_SETTINGS
}
*/
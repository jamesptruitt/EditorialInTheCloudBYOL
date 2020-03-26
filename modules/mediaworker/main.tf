locals {
    mediaworker_vm_script_url       = "${var.software_install_urls["mediaworker_vm_script_url"]}"
    avid_nexis_client_url           = "${var.software_install_urls["avid_nexis_client_url"]}"
    google_chrome_enterprise_url    = "${var.software_install_urls["google_chrome_enterprise_url"]}"
    putty_url                       = "${var.software_install_urls["putty_url"]}"
    mam_control_service_url         = "${var.software_install_urls["mam_control_service_url"]}"
}

#################################
# Window VM(s) for Mediaworkers #
#################################
module "media_worker" {
  source                          = "../azurevm"
  resource_group_name             = var.resource_group_name
  location                        = var.resource_group_location
  vm_hostname                     = var.hostname
  admin_password                  = var.admin_password
  admin_username                  = var.admin_username
  vm_os_simple                    = "WindowsServer"
  public_ip_dns                   = var.mediaworker_vm_public_ip_dns
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

resource "azurerm_virtual_machine_extension" "media_worker" {
  name                  = format("${var.hostname}-%02.0f",count.index + var.base_index)
  count                 = var.mediaworker_vm_instances
  virtual_machine_name  = format("${var.hostname}-%02.0f",count.index + var.base_index)
  resource_group_name   = var.resource_group_name
  location              = var.resource_group_location
  publisher             = "Microsoft.Compute"
  type                  = "CustomScriptExtension"
  type_handler_version  = "1.9"
  depends_on            = [module.media_worker]
  tags                  = var.tags

  # CustomVMExtension Documetnation: https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-windows
  settings = <<SETTINGS
    {
        "fileUris": ["${local.mediaworker_vm_script_url}"]
    }
SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
    {
      "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File SetupWorkerMachine.ps1 ${local.avid_nexis_client_url} ${local.google_chrome_enterprise_url} ${local.putty_url} ${local.mam_control_service_url}"
    }
  PROTECTED_SETTINGS
}
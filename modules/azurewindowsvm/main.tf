module "os" {
  source       = "./os"
  vm_os_simple = var.vm_os_simple
}

resource "random_id" "vm-sa" {
  keepers = {
    vm_hostname = var.vm_hostname
  }

  byte_length = 6
}

resource "azurerm_storage_account" "vm-sa" {
  count                    = var.boot_diagnostics ? 1 : 0
  name                     = "bootdiag${lower(random_id.vm-sa.hex)}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = element(split("_", var.boot_diagnostics_sa_type), 0)
  account_replication_type = element(split("_", var.boot_diagnostics_sa_type), 1)
  tags                     = var.tags
}

resource "azurerm_availability_set" "vm" {
  name                         = "${var.vm_hostname}-avset"
  count                        = var.nb_instances > 0 ? 1 : 0
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true
  tags                         = var.tags
}

resource "azurerm_public_ip" "vm" {
  count               = var.nb_public_ip
  name                = format("${var.vm_hostname}-%02.0f-publicIP",count.index + var.base_index)
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = coalesce(var.allocation_method, var.public_ip_address_allocation, "Dynamic")
  domain_name_label   = format("${var.vm_hostname}-%02.0f-${random_id.vm-sa.hex}",count.index + var.base_index)
  tags                = var.tags
}

resource "azurerm_network_interface" "vm" {
  count                         = var.nb_instances
  name                          = format("nic-${var.vm_hostname}-%02.0f",count.index + var.base_index)
  location                      = var.location
  resource_group_name           = var.resource_group_name
  enable_accelerated_networking = var.enable_accelerated_networking

  ip_configuration {
    name                          = "ipconfig${count.index}"
    subnet_id                     = var.vnet_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = length(azurerm_public_ip.vm.*.id) > 0 ? element(concat(azurerm_public_ip.vm.*.id, list("")), count.index) : ""
  }

  tags = var.tags
}

resource "azurerm_windows_virtual_machine" "vm-windows" {
  count                         = var.data_disk ? 0 : var.nb_instances 
  name                          = var.hide_suffix ? var.vm_hostname : format("${var.vm_hostname}-%02.0f",count.index + var.base_index)
  computer_name                 = var.hide_suffix ? var.vm_hostname : format("${var.vm_hostname}-%02.0f",count.index + var.base_index)
  location                      = var.location
  resource_group_name           = var.resource_group_name
  admin_username                = var.admin_username
  admin_password                = var.admin_password
  availability_set_id           = azurerm_availability_set.vm.*.id[0]
  size                          = var.vm_size
  network_interface_ids         = [element(azurerm_network_interface.vm.*.id, count.index)]
  provision_vm_agent            = true

  source_image_id = var.vm_os_id

  os_disk {
    name                  = format("osdisk-${var.vm_hostname}-%02.0f",count.index + var.base_index)
    caching               = "ReadWrite"
    storage_account_type  = var.storage_account_type
    disk_size_gb          = var.os_disk_size_gb
  }

  #boot_diagnostics {
  #  storage_account_uri = var.boot_diagnostics ? join(",", azurerm_storage_account.vm-sa.*.primary_blob_endpoint) : ""
  #}

  tags = var.tags

}

resource "azurerm_windows_virtual_machine" "vm-windows-with-datadisk" {
  count                         = var.data_disk ? var.nb_instances : 0
  name                          = var.hide_suffix ? var.vm_hostname : format("${var.vm_hostname}-%02.0f",count.index + var.base_index)
  computer_name                 = var.hide_suffix ? var.vm_hostname : format("${var.vm_hostname}-%02.0f",count.index + var.base_index)
  location                      = var.location
  admin_username                = var.admin_username
  admin_password                = var.admin_password
  resource_group_name           = var.resource_group_name
  availability_set_id           = azurerm_availability_set.vm.*.id[0]
  size                          = var.vm_size
  network_interface_ids         = [element(azurerm_network_interface.vm.*.id, count.index)]
  provision_vm_agent            = true

  source_image_id = var.vm_os_id

  os_disk {
    name                  = format("osdisk-${var.vm_hostname}-%02.0f",count.index + var.base_index)
    caching               = "ReadWrite"
    storage_account_type  = var.storage_account_type
    disk_size_gb          = var.os_disk_size_gb
  }

  tags = var.tags

  #boot_diagnostics {
   # storage_account_uri = var.boot_diagnostics ? join(",", azurerm_storage_account.vm-sa.*.primary_blob_endpoint) : ""
  #}
}

resource "azurerm_managed_disk" "example" {
  name                  = format("datadisk-${var.vm_hostname}-%02.0f",count.index + var.base_index)
  count                 = var.data_disk ? var.nb_instances : 0
  location              = var.location
  resource_group_name   = var.resource_group_name
  storage_account_type  = var.data_sa_type
  create_option         = "Empty"
  disk_size_gb          = var.data_disk_size_gb
}

resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  count               =var.data_disk ? var.nb_instances : 0
  managed_disk_id     = element(azurerm_managed_disk.example.*.id, count.index)
  virtual_machine_id  = element(azurerm_windows_virtual_machine.vm-windows.*.id, count.index)
  lun                 = "10"
  caching             = "ReadWrite"
}
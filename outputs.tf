/*
output "azurerm_resource_group_id" {
  value       = "${module.editorial_networking.azurerm_resource_group_id}"
  description = "The ID of resource group created"
}
*/
output "azurerm_resource_group_name" {
  value       = "${module.editorial_networking.azurerm_resource_group_name}"
  description = "The name of resource group created"
}
output "azurerm_resource_group_location" {
  value       = "${module.editorial_networking.azurerm_resource_group_location}"
  description = "The location/region of resource group created"
}
output "azurerm_virtual_network_id" {
  value       = "${module.editorial_networking.vnet_id}"
  description = "The virtual Network Configuration ID"
}
output "azurerm_virtual_network_name" {
  value       = "${module.editorial_networking.vnet_name}"
  description = "The name of the virtual network"
}

output "azurerm_virtual_network_location" {
  value       = "${module.editorial_networking.vnet_location}"
  description = "The location/region where the virtual network is created"
}
output "azurerm_virtual_network_address_space" {
  value       = "${module.editorial_networking.vnet_address_space}"
  description = "The address space that is used the virtual network"
}
output "azurerm_subnet_ids" {
  value       = "${module.editorial_networking.vnet_subnets}"
  description = "The subnet IDs for the VNET"
}
/*
output "azurerm_route_table_id" {
  value       = "${module.show_networking.azurerm_route_table_id}"
  description = "The routing table ID"
}
*/
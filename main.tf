#############################
# Locals                    #
#############################
locals {
  resource_group_name             = "mytest"
  location                        = "eastus"
  admin_username                  = "azureuser"
  admin_password                  = "Password12345"
  nexis_vm_size                   = "Standard_DS4_V2"
  nexis_instances                 = 1
  nexis_storage_vm_public_ip_dns  = ["nx00-${random_string.general.result}"]
  nexis_type                      = "CloudNearline" # options "CloudNearline" or "CloudOnline"
  mediaworker_vm_size             = "Standard_DS4_V2"
  mediaworker_vm_instances        = 2
  mediaworker_vm_public_ip_dns    = ["mw00-${random_string.general.result}","mw01-${random_string.general.result}"]
  mediacomposer_vm_size           = "Standard_DS4_V2"
  mediacomposer_vm_instances      = 1
  mediacomposer_vm_public_ip_dns  = ["mc00-${random_string.general.result}","mc01-${random_string.general.result}"]
  azureTags = {
                "environment" = "dev"
              }
}

#############################
# Resources                 #
#############################
module "editorial_networking" {
  source              = "./modules/azurenetwork"
  vnet_name           = "${local.resource_group_name}-vnet" 
  resource_group_name = "${local.resource_group_name}-${random_string.general.result}-rg" 
  location            = local.location
  address_space       = "10.0.0.0/16"
  dns_servers         = []
  subnet_prefixes     = ["10.0.1.0/24"]
  subnet_names        = ["default"]
  allow_rdp_traffic   = true  
  allow_ssh_traffic   = true  
  sg_name             = "${local.resource_group_name}-secgrp"
  tags                = local.azureTags
}

locals {
  stored_resource_group_name      = module.editorial_networking.azurerm_resource_group_name
  stored_resource_group_location  = module.editorial_networking.azurerm_resource_group_location
  stored_subnet_id                = module.editorial_networking.azurerm_subnet_ids[0]
}

module "nexis_deployment" {
  source                            = "./modules/nexis"
  hostname                          = "nexis"
  admin_password                    = local.admin_password
  resource_group_name               = local.stored_resource_group_name
  resource_group_location           = local.stored_resource_group_location
  subnet_id                         = local.stored_subnet_id
  nexis_storage_type                = local.nexis_type
  nexis_storage_vm_size             = local.nexis_vm_size
  nexis_storage_vm_instances        = local.nexis_instances
  nexis_storage_vm_number_public_ip = local.nexis_instances
  nexis_storage_vm_public_ip_dns    = local.nexis_storage_vm_public_ip_dns
  tags                              = local.azureTags
}

module "mediaworker_deployment" {
  source                          = "./modules/mediaworker"
  hostname                        = "mworker"
  admin_username                  = local.admin_username
  admin_password                  = local.admin_password
  resource_group_name             = local.stored_resource_group_name
  resource_group_location         = local.stored_resource_group_location
  subnet_id                       = local.stored_subnet_id
  mediaworker_vm_size             = local.mediaworker_vm_size
  mediaworker_vm_instances        = local.mediaworker_vm_instances
  mediaworker_vm_number_public_ip = local.mediaworker_vm_instances
  mediaworker_vm_public_ip_dns    = local.mediaworker_vm_public_ip_dns
  tags                            = local.azureTags
}

module "mediacomposer_deployment" {
  source                            = "./modules/mediacomposer"
  hostname                          = "mcomposer"
  admin_username                    = local.admin_username
  admin_password                    = local.admin_password
  resource_group_name               = local.stored_resource_group_name
  resource_group_location           = local.stored_resource_group_location
  subnet_id                         = local.stored_subnet_id
  mediacomposer_vm_size             = local.mediacomposer_vm_size
  mediacomposer_vm_instances        = local.mediacomposer_vm_instances
  mediacomposer_vm_number_public_ip = local.mediacomposer_vm_instances
  mediacomposer_vm_public_ip_dns    = local.mediacomposer_vm_public_ip_dns
  tags                              = local.azureTags
}

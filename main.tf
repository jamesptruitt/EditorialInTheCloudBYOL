terraform {

}

provider "azurerm" {
  version = "~> 2.5"
  features {}
}

provider "random" {
  version = "~> 2.2"
}

locals {
  resource_group_name               = var.resource_group_name
  location                          = var.location
  
  admin_username                    = var.admin_username
  admin_password                    = var.admin_password
  
  address_space                     = var.address_space
  subnet_prefixes                   = var.subnet_prefixes
  dns_servers                       = var.dns_servers
  subnet_names                      = var.subnet_names
  
  source_address_prefix             = var.source_address_prefix 
  
  jump_box_vm_size                  = var.jump_box_vm_size
  jump_box_base_index               = var.jump_box_base_index
  jump_box_vm_instances             = var.jump_box_vm_instances
  jump_box_vm_number_public_ip      = var.jump_box_vm_number_public_ip
  
  mediacomposer_vm_size             = var.mediacomposer_vm_size
  mediacomposer_base_index          = var.mediacomposer_base_index
  mediacomposer_vm_instances        = var.mediacomposer_vm_instances 
  mediacomposer_vm_number_public_ip = var.mediacomposer_vm_number_public_ip

  nexis_vm_size                     = var.nexis_vm_size
  nexis_base_index                  = var.nexis_base_index
  nexis_instances                   = var.nexis_instances
  nexis_storage_vm_number_public_ip = var.nexis_storage_vm_number_public_ip
  nexis_type                        = var.nexis_type   # options "CloudNearline" or "CloudOnline"
    
  mediaworker_vm_size               = var.mediaworker_vm_size 
  mediaworker_base_index            = var.mediaworker_base_index
  mediaworker_vm_instances          = var.mediaworker_vm_instances
  mediaworker_vm_number_public_ip   = var.mediaworker_vm_number_public_ip
  
  media_central_vm_size             = var.media_central_vm_size
  media_central_base_index          = var.media_central_base_index
  media_central_vm_instances        = var.media_central_vm_instances
  media_central_vm_number_public_ip = var.media_central_vm_number_public_ip

  shared_image_gallery_subscription_id  = var.shared_image_gallery_subscription_id
  shared_image_gallery_client_id        = var.shared_image_gallery_client_id 
  shared_image_gallery_client_secret    = var.shared_image_gallery_client_secret
  shared_image_gallery_tenant_id        = var.shared_image_gallery_tenant_id 
  gallery_name                          = var.gallery_name
  gallery_resource_group_name           = var.gallery_resource_group_name
  
  media_composer_image_version          = "${element(split(",", lookup(var.mediacomposer_storage_image, var.mediacomposer_type, "")), 0)}"
  media_composer_image_name             = "${element(split(",", lookup(var.mediacomposer_storage_image, var.mediacomposer_type, "")), 1)}"

  jumpbox_image_version                 = var.jumpbox_image_version
  jumpbox_image_name                    = var.jumpbox_image_name 

  nexis_image_version                   = "${element(split(",", lookup(var.nexis_storage_image, var.nexis_type, "")), 0)}"
  nexis_image_name                      = "${element(split(",", lookup(var.nexis_storage_image, var.nexis_type, "")), 1)}" 

  media_central_image_version           = var.media_central_image_version
  media_central_image_name              = var.media_central_image_name 

  media_worker_image_version            = var.media_worker_image_version
  media_worker_image_name               = var.media_worker_image_name

  azureTags                             = var.azureTags
}

#############################
# Machine Images            #
#############################
module "media_central_image" {
  source                                = "./modules/sharedimagegallery"
  shared_image_gallery_subscription_id  = local.shared_image_gallery_subscription_id
  shared_image_gallery_client_id        = local.shared_image_gallery_client_id
  shared_image_gallery_client_secret    = local.shared_image_gallery_client_secret
  shared_image_gallery_tenant_id        = local.shared_image_gallery_tenant_id 
  gallery_name                          = local.gallery_name  
  gallery_resource_group_name           = local.gallery_resource_group_name  
  shared_image_version                  = local.media_central_image_version
  shared_image_name                     = local.media_central_image_name
}

module "jumpbox_image" {
  source                                = "./modules/sharedimagegallery"
  shared_image_gallery_subscription_id  = local.shared_image_gallery_subscription_id
  shared_image_gallery_client_id        = local.shared_image_gallery_client_id
  shared_image_gallery_client_secret    = local.shared_image_gallery_client_secret
  shared_image_gallery_tenant_id        = local.shared_image_gallery_tenant_id 
  gallery_name                          = local.gallery_name  
  gallery_resource_group_name           = local.gallery_resource_group_name  
  shared_image_version                  = local.jumpbox_image_version
  shared_image_name                     = local.jumpbox_image_name
}

module "nexis_image" {
  source                                = "./modules/sharedimagegallery"
  shared_image_gallery_subscription_id  = local.shared_image_gallery_subscription_id
  shared_image_gallery_client_id        = local.shared_image_gallery_client_id
  shared_image_gallery_client_secret    = local.shared_image_gallery_client_secret
  shared_image_gallery_tenant_id        = local.shared_image_gallery_tenant_id 
  gallery_name                          = local.gallery_name  
  gallery_resource_group_name           = local.gallery_resource_group_name  
  shared_image_version                  = local.nexis_image_version
  shared_image_name                     = local.nexis_image_name
}

module "media_composer_image" {
  source                                = "./modules/sharedimagegallery"
  shared_image_gallery_subscription_id  = local.shared_image_gallery_subscription_id
  shared_image_gallery_client_id        = local.shared_image_gallery_client_id
  shared_image_gallery_client_secret    = local.shared_image_gallery_client_secret
  shared_image_gallery_tenant_id        = local.shared_image_gallery_tenant_id 
  gallery_name                          = local.gallery_name  
  gallery_resource_group_name           = local.gallery_resource_group_name  
  shared_image_version                  = local.media_composer_image_version
  shared_image_name                     = local.media_composer_image_name
}

module "media_worker_image" {
  source                                = "./modules/sharedimagegallery"
  shared_image_gallery_subscription_id  = local.shared_image_gallery_subscription_id
  shared_image_gallery_client_id        = local.shared_image_gallery_client_id
  shared_image_gallery_client_secret    = local.shared_image_gallery_client_secret
  shared_image_gallery_tenant_id        = local.shared_image_gallery_tenant_id 
  gallery_name                          = local.gallery_name  
  gallery_resource_group_name           = local.gallery_resource_group_name  
  shared_image_version                  = local.media_worker_image_version
  shared_image_name                     = local.media_worker_image_name
}

locals{
  media_central_image_id  = module.media_central_image.shared_image_gallery_image_id
  jumpbox_image_id        = module.jumpbox_image.shared_image_gallery_image_id
  media_composer_image_id = module.media_composer_image.shared_image_gallery_image_id
  nexis_image_id          = module.nexis_image.shared_image_gallery_image_id
  media_worker_image_id   = module.media_worker_image.shared_image_gallery_image_id
}

#############################
# Resources                 #
#############################
module "editorial_networking" {
  source              = "./modules/azurenetwork"
  vnet_name           = "${local.resource_group_name}-vnet" 
  resource_group_name = "${local.resource_group_name}-${random_string.general.result}-rg" 
  location            = local.location
  address_space       = local.address_space
  dns_servers         = local.dns_servers
  subnet_prefixes     = local.subnet_prefixes
  subnet_names        = local.subnet_names
  allow_rdp_traffic   = true  
  allow_ssh_traffic   = true  
  sg_name             = "${local.resource_group_name}-secgrp"
  tags                = local.azureTags
}

locals {
  stored_resource_group_name      = module.editorial_networking.azurerm_resource_group_name
  stored_resource_group_location  = module.editorial_networking.azurerm_resource_group_location
  stored_subnet_id                = module.editorial_networking.vnet_subnets
}

#############################
# Deployments               #
#############################
module "media_composer_deployment" {
  source                            = "./modules/mediacomposer"
  hostname                          = "mcomposer"
  admin_username                    = local.admin_username
  admin_password                    = local.admin_password
  resource_group_name               = local.stored_resource_group_name
  resource_group_location           = local.stored_resource_group_location
  subnet_id                         = local.stored_subnet_id[0] 
  source_address_prefix             = local.source_address_prefix
  base_index                        = local.mediacomposer_base_index 
  mediacomposer_vm_size             = local.mediacomposer_vm_size
  mediacomposer_vm_instances        = local.mediacomposer_vm_instances
  mediacomposer_vm_number_public_ip = local.mediacomposer_vm_number_public_ip
  mediacomposer_vm_os_id            = local.media_composer_image_id
  tags                              = local.azureTags
}

module "jump_box_deployment" {
  source                        = "./modules/jumpbox"
  hostname                      = "jumpbox"
  admin_username                = local.admin_username
  admin_password                = local.admin_password
  resource_group_name           = local.stored_resource_group_name
  resource_group_location       = local.stored_resource_group_location
  subnet_id                     = local.stored_subnet_id[0] 
  source_address_prefix         = local.source_address_prefix
  base_index                    = local.jump_box_base_index 
  jump_box_vm_size              = local.jump_box_vm_size
  jump_box_vm_instances         = local.jump_box_vm_instances
  jump_box_vm_number_public_ip  = local.jump_box_vm_number_public_ip
  jump_box_vm_os_id             = local.jumpbox_image_id
  tags                          = local.azureTags
}

module "nexis_deployment" {
  source                            = "./modules/nexis"
  hostname                          = "nexis"
  admin_password                    = local.admin_password
  resource_group_name               = local.stored_resource_group_name
  resource_group_location           = local.stored_resource_group_location
  subnet_id                         = local.stored_subnet_id[1] 
  source_address_prefix             = local.source_address_prefix
  base_index                        = local.nexis_base_index 
  nexis_storage_type                = local.nexis_type
  nexis_storage_vm_size             = local.nexis_vm_size
  nexis_storage_vm_instances        = local.nexis_instances
  nexis_storage_vm_number_public_ip = local.nexis_storage_vm_number_public_ip
  nexis_vm_os_id                    = local.nexis_image_id
  tags                              = local.azureTags
}


module "media_central_deployment" {
  source                            = "./modules/mediacentral"
  hostname                          = "mcentral"
  admin_username                    = local.admin_username
  admin_password                    = local.admin_password
  resource_group_name               = local.stored_resource_group_name
  resource_group_location           = local.stored_resource_group_location
  subnet_id                         = local.stored_subnet_id[0] 
  source_address_prefix             = local.source_address_prefix
  base_index                        = local.media_central_base_index 
  media_central_vm_size             = local.media_central_vm_size
  media_central_vm_instances        = local.media_central_vm_instances
  media_central_vm_number_public_ip = local.media_central_vm_number_public_ip
  media_central_vm_os_id            = local.media_central_image_id
  tags                              = local.azureTags
}

module "media_worker_deployment" {
  source                          = "./modules/mediaworker"
  hostname                        = "mworker"
  admin_username                  = local.admin_username
  admin_password                  = local.admin_password
  resource_group_name             = local.stored_resource_group_name
  resource_group_location         = local.stored_resource_group_location
  subnet_id                       = local.stored_subnet_id[0] 
  source_address_prefix           = local.source_address_prefix
  base_index                      = local.mediaworker_base_index 
  mediaworker_vm_size             = local.mediaworker_vm_size
  mediaworker_vm_instances        = local.mediaworker_vm_instances
  mediaworker_vm_number_public_ip = local.mediaworker_vm_number_public_ip
  mediaworker_vm_os_id            = local.media_worker_image_id
  tags                            = local.azureTags
}

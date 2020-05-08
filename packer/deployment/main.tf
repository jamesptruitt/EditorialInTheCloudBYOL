variable "shared_image_gallery_subscription_id" {
  description = "description"
}

variable "shared_image_gallery_client_id" {
  description = "description"
}

variable "shared_image_gallery_client_secret" {
  description = "description"
}

variable "shared_image_gallery_tenant_id" {
  description = "description"
}

variable "shared_image_version" {
  description = "description"
}

variable "shared_image_name" {
  description = "description"
}

variable "gallery_name" {
  description = "description"
}

variable "gallery_resource_group_name" {
  description = "description"
}

provider "azurerm" {
  alias = "sharedgalleryreader"
  features {}
  subscription_id = var.shared_image_gallery_subscription_id
  client_id       = var.shared_image_gallery_client_id
  client_secret   = var.shared_image_gallery_client_secret
  tenant_id       = var.shared_image_gallery_tenant_id
}

data "azurerm_shared_image_version" "shared_image" {
  provider            = azurerm.sharedgalleryreader
  name                = var.shared_image_version
  image_name          = var.shared_image_name
  gallery_name        = var.gallery_name
  resource_group_name = var.gallery_resource_group_name
}

data "azurerm_shared_image" "shared_image" {
  provider            = azurerm.sharedgalleryreader
  name                = var.shared_image_name
  gallery_name        = var.gallery_name
  resource_group_name = var.gallery_resource_group_name
}

output "shared_image_gallery_image_id" {
  value = "${data.azurerm_shared_image.shared_image.id}"
}
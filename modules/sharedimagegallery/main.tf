provider "azurerm" {
  alias = "sharedgalleryreader"
  features {}
  subscription_id = var.shared_image_gallery_subscription_id
  client_id       = var.shared_image_gallery_client_id
  client_secret   = var.shared_image_gallery_client_secret
  tenant_id       = var.shared_image_gallery_tenant_id
}

# Import the Shared Image Gallery Resource
data "azurerm_shared_image_version" "shared_image" {
  provider            = azurerm.sharedgalleryreader
  name                = var.shared_image_version
  image_name          = var.shared_image_name
  gallery_name        = var.gallery_name
  resource_group_name = var.gallery_resource_group_name
}
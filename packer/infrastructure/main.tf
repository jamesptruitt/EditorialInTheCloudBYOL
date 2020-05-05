terraform {

}

variable "subscription_id" {
  description = ""
}

variable "client_id" {
    description = ""
} 

variable "client_secret" {
    description = ""
} 

variable "tenant_id" {
    description = ""
} 

# Configure the Azure Provider
provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
  version = "~>2.5"
}

locals{
  resource_group_name         = "shared-images"
  location                    = "eastus"
  shared_image_gallery_name   = "shared_image_gallery"
  shared_tags                 = {
                                  "environment" = "sharedimages"
                                }
}

resource "azurerm_resource_group" "shared-images" {
    name        =  local.resource_group_name
    location    = local.location
    tags        = local.shared_tags
}

resource "azurerm_shared_image_gallery" "shared-images" {
    name                = local.shared_image_gallery_name
    resource_group_name = azurerm_resource_group.shared-images.name
    location            = azurerm_resource_group.shared-images.location
    description         = "Shared images and things."
    tags                = local.shared_tags
}

resource "azurerm_shared_image" "shared-images-MediaCentral" {
  name                = "MediaCentral"
  gallery_name        = azurerm_shared_image_gallery.shared-images.name
  resource_group_name = azurerm_resource_group.shared-images.name
  location            = azurerm_resource_group.shared-images.location
  os_type             = "Linux"

  identifier {
    publisher = "SharedImages"
    offer     = "EditorialInTheCloud"
    sku       = "MediaCentral"
  }
}

resource "azurerm_shared_image" "shared-images-MediaComposer" {
  name                = "MediaComposer"
  gallery_name        = azurerm_shared_image_gallery.shared-images.name
  resource_group_name = azurerm_resource_group.shared-images.name
  location            = azurerm_resource_group.shared-images.location
  os_type             = "Windows"

  identifier {
    publisher = "SharedImages"
    offer     = "EditorialInTheCloud"
    sku       = "MediaComposer"
  }
}

resource "azurerm_shared_image" "shared-images-MediaComposer2020" {
  name                = "MediaComposer2020"
  gallery_name        = azurerm_shared_image_gallery.shared-images.name
  resource_group_name = azurerm_resource_group.shared-images.name
  location            = azurerm_resource_group.shared-images.location
  os_type             = "Windows"

  identifier {
    publisher = "SharedImages"
    offer     = "EditorialInTheCloud"
    sku       = "MediaComposer2020"
  }
}

resource "azurerm_shared_image" "shared-images-MediaComposer" {
  name                = "MediaWorker"
  gallery_name        = azurerm_shared_image_gallery.shared-images.name
  resource_group_name = azurerm_resource_group.shared-images.name
  location            = azurerm_resource_group.shared-images.location
  os_type             = "Windows"

  identifier {
    publisher = "SharedImages"
    offer     = "EditorialInTheCloud"
    sku       = "MediaWorker"
  }
}

resource "azurerm_shared_image" "shared-images-Nexis" {
  name                = "Nexis"
  gallery_name        = azurerm_shared_image_gallery.shared-images.name
  resource_group_name = azurerm_resource_group.shared-images.name
  location            = azurerm_resource_group.shared-images.location
  os_type             = "Linux"

  identifier {
    publisher = "SharedImages"
    offer     = "EditorialInTheCloud"
    sku       = "Nexis"
  }
}

resource "azurerm_shared_image" "shared-images-Jumpbox" {
  name                = "Jumpbox"
  gallery_name        = azurerm_shared_image_gallery.shared-images.name
  resource_group_name = azurerm_resource_group.shared-images.name
  location            = azurerm_resource_group.shared-images.location
  os_type             = "Windows"

  identifier {
    publisher = "SharedImages"
    offer     = "EditorialInTheCloud"
    sku       = "Jumpbox"
  }
}
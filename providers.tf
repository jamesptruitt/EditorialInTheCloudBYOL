#Set the terraform required version and the backend
terraform {
}
# Configure the Azure Provider
provider "azurerm" {
  # It is recommended to pin to a given version of the Provider
  #subscription_id = var.subscription_id
  #client_id       = var.client_id
  #client_secret   = var.client_secret
  #tenant_id       = var.tenant_id
  version         = "~>1.44.0"
}

provider "random" {
  version = "~> 2.2"
}
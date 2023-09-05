# Main

# Azure Provider
provider "azurerm" {
  features {}
    client_id       = var.client_id
    client_secret   = var.client_secret
    tenant_id       = var.tenant_id
    subscription_id = var.subscription_id
}

# Create a random id
resource "random_id" "buildSuffix" {
  byte_length = 2
}

# Create a Resource Group
resource "azurerm_resource_group" "main" {
  name     = format("%s-rg-%s", var.projectPrefix, random_id.buildSuffix.hex)
  location = var.location
  tags = {
    owner = var.resourceOwner
  }
}

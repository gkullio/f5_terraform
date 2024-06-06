resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = [var.vnet_address_space]
}

resource "azurerm_subnet" "mgmt" {
  name                 = var.mgmt_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.mgmt_address_space]
}

resource "azurerm_subnet" "ext" {
  name                 = var.ext_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.ext_address_space]
}

resource "azurerm_subnet" "int" {
  name                 = var.int_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.int_address_space]
}


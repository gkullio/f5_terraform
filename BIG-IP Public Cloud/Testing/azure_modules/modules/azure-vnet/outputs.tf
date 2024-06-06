output "vnet_id" {
  description   = "The ID of the virtual network"
  value         = azurerm_virtual_network.vnet.id
}
output "mgmt_subnet_id" {
  description   = "The ID of the management subnet"
  value         = azurerm_subnet.mgmt.id
}
output "ext_subnet_id" {
  description   = "The ID of the external subnet"
  value         = azurerm_subnet.ext.id  
}
output "int_subnet_id" {
  description   = "The ID of the internal subnet"
  value         = azurerm_subnet.int.id
}

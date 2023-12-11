#  Network Outputs

output "resource_group" {
  description = "Resource group name"
  value       = azurerm_resource_group.main.name
}
output "vnet" {
  description = "VNet name"
  value       = azurerm_virtual_network.main.name
}
output "mgmt_subnet_addresses" {
  description = "Management subnet address prefix"
  value       = azurerm_subnet.mgmt.address_prefixes
}
output "mgmt_subnet_name" {
  description = "Management subnet name"
  value       = azurerm_subnet.mgmt.name
}
output "mgmt_security_group_name" {
  description = "Management security group name"
  value       = azurerm_network_security_group.mgmt.name
}
# BIGIP Outputs

output "f5vm01_mgmt_private_ip" {
  description = "f5vm01 management private IP address"
  value       = module.bigip.private_addresses["mgmt_private"]["private_ip"][0]
}
output "f5vm01_mgmt_public_ip" {
  description = "f5vm01 management public IP address"
  value       = module.bigip.mgmtPublicIP
}
output "f5vm01_mgmt_pip_url" {
  description = "f5vm01 management public URL"
  value       = "https://${module.bigip.mgmtPublicIP}"
}
output "f5vm01_instance_ids" {
  description = "f5vm01 management device name"
  value       = module.bigip.bigip_instance_ids
}

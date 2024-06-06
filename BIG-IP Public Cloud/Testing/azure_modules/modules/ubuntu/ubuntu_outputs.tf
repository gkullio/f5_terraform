output "management_public_ip_address" {
  value = azurerm_linux_virtual_machine.kulland_ubuntu_vm.public_ip_address
}
output "management_public_ip_address_different_resource" {
  value = azurerm_public_ip.management_pubip.ip_address
}

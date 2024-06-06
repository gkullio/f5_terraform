output management_public_ip {
    value = azurerm_public_ip.management_pubip.ip_address
}

output application_ip_1 {
    value = azurerm_public_ip.external_pubip_2.ip_address
}

output application_ip_2 {
    value = azurerm_public_ip.external_pubip_3.ip_address
}

output application_ip_1_private {
    value = azurerm_network_interface.external_nic.private_ip_addresses[1]
}
output application_ip_2_private {
    value = azurerm_network_interface.external_nic.private_ip_addresses[2]
}

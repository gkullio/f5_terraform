# Create F5 BIGIP1 VM
resource "azurerm_linux_virtual_machine" "big-ip-test" {
  name                            = var.vm_name == "" ? format("%s-f5vm01", var.instance_prefix) : var.vm_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  network_interface_ids           = [azurerm_network_interface.management_nic.id, azurerm_network_interface.external_nic.id, azurerm_network_interface.internal_nic.id]
  size                            = var.instance_size
  disable_password_authentication = var.enable_ssh_key
  computer_name                   = var.vm_name == "" ? format("%s-f5vm01", var.instance_prefix) : var.vm_name
  admin_username                  = var.bigip-username
  admin_password                  = var.bigip-password
  custom_data = base64encode(coalesce(var.custom_user_data, templatefile("${path.module}/${var.script_name}.tmpl",
    {
      INIT_URL                   = var.INIT_URL
      DO_URL                     = var.DO_URL
      AS3_URL                    = var.AS3_URL
      TS_URL                     = var.TS_URL
      CFE_URL                    = var.CFE_URL
      FAST_URL                   = var.FAST_URL,
      DO_VER                     = format("v%s", split("-", split("/", var.DO_URL)[length(split("/", var.DO_URL)) - 1])[3])
      AS3_VER                    = format("v%s", split("-", split("/", var.AS3_URL)[length(split("/", var.AS3_URL)) - 1])[2])
      TS_VER                     = format("v%s", split("-", split("/", var.TS_URL)[length(split("/", var.TS_URL)) - 1])[2])
      CFE_VER                    = format("v%s", split("-", split("/", var.CFE_URL)[length(split("/", var.CFE_URL)) - 1])[3])
      FAST_VER                   = format("v%s", split("-", split("/", var.FAST_URL)[length(split("/", var.FAST_URL)) - 1])[3])
      bigip_username             = var.f5_username
      bigip_username_2           = var.f5_username_2
      ssh_keypair                = var.ssh_publickey
      bigip_password             = var.f5_password
      dns_server                 = var.dns_server
      dns_suffix                 = var.dns_suffix
      ntp_server                 = var.ntp_server
      timezone                   = var.timezone
      app1_ip                    = azurerm_network_interface.external_nic.private_ip_addresses[1]
      app2_ip                    = azurerm_network_interface.external_nic.private_ip_addresses[2]
  })))
  source_image_reference {
    offer     = var.f5_product_name
    publisher = var.image_publisher
    sku       = var.f5_image_name
    version   = var.f5_version
  }

  os_disk {
    caching                   = "ReadWrite"
    disk_size_gb              = 84
    name                      = "${var.instance_prefix}-osdisk-f5vm01"
    storage_account_type      = var.storage_account_type
    write_accelerator_enabled = false
  }

  admin_ssh_key {
    public_key = file(var.ssh_publickey)
    username   = var.bigip-username
  }
  plan {
    name      = var.f5_image_name
    product   = var.f5_product_name
    publisher = var.image_publisher
  }
  zone = var.availability_zone

  tags = {
    owner = var.resourceOwner
  }

#  depends_on = [azurerm_network_interface_security_group_association.mgmt_security, azurerm_network_interface_security_group_association.internal_security, azurerm_network_interface_security_group_association.external_security, azurerm_network_interface_security_group_association.external_public_security]
}
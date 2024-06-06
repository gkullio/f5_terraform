# Create virtual machine
resource "azurerm_linux_virtual_machine" "kulland_ubuntu_vm" {
  name                  = "Kulland-Ubuntu"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.management_nic.id, azurerm_network_interface.internal_nic.id]
  size                  = var.instance_size
  custom_data           = filebase64("${path.module}/nginx.tpl")

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name  = var.ubuntu-hostname
  admin_username = var.ubuntu-username
  admin_password = var.ubuntu-password

  admin_ssh_key {
    username   = var.ubuntu-username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.my_storage_account.primary_blob_endpoint
  }
}
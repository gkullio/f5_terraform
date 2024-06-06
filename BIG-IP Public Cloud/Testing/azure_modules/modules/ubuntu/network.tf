# Create public IPs
resource "azurerm_public_ip" "management_pubip" {
  name                = "ubuntu-management_pubip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"   # Static is required due to the use of the Standard sku
  sku                 = "Standard" # the Standard sku is required due to the use of availability zones
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "management_nsg" {
  name                = "ubuntu-mgmt-NSG"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "SSH-WebUI"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["22", "443"]
    source_address_prefixes    = var.adminSrcAddr
    destination_address_prefix = "*"
  }
  tags = {
    owner = var.resourceOwner
  }  
}

resource "azurerm_network_security_group" "internal_nsg" {
  name                = "ubuntu-internal-NSG"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = {
    owner = var.resourceOwner
  }
}  

# Create network interface
resource "azurerm_network_interface" "management_nic" {
  name                = "ubuntu-management-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "managenment_nic_configuration"
    subnet_id                     = var.mgmt_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.management_pubip.id
  }
}

resource "azurerm_network_interface" "internal_nic" {
  name                = "ubuntu-internal-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal_nic_configuration"
    subnet_id                     = var.int_subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.245.3.50"
    primary                       = true
  }
  ip_configuration {
    name                          = "internal_nic_configuration_1"
    subnet_id                     = var.int_subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.245.3.100"
  }
  ip_configuration {
    name                          = "internal_nic_configuration_2"
    subnet_id                     = var.int_subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.245.3.101"
  }
  ip_configuration {
    name                          = "internal_nic_configuration_3"
    subnet_id                     = var.int_subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.245.3.102"
  }
    ip_configuration {
    name                          = "internal_nic_configuration_4"
    subnet_id                     = var.int_subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.245.3.103"
  }
    ip_configuration {
    name                          = "internal_nic_configuration_5"
    subnet_id                     = var.int_subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.245.3.104"
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "mgmt" {
  network_interface_id      = azurerm_network_interface.management_nic.id
  network_security_group_id = azurerm_network_security_group.management_nsg.id
}

resource "azurerm_network_interface_security_group_association" "internal" {
  network_interface_id      = azurerm_network_interface.internal_nic.id
  network_security_group_id = azurerm_network_security_group.internal_nsg.id
}
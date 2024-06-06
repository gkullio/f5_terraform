# Create public IPs
resource "azurerm_public_ip" "management_pubip" {
  name                = "bigip-management_pubip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"   # Static is required due to the use of the Standard sku
  sku                 = "Standard" # the Standard sku is required due to the use of availability zones
}

resource "azurerm_public_ip" "external_pubip" {
  name                = "bigip-external_pubip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"   # Static is required due to the use of the Standard sku
  sku                 = "Standard" # the Standard sku is required due to the use of availability zones
}

resource "azurerm_public_ip" "external_pubip_2" {
  name                = "bigip-external_pubip_2"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"   # Static is required due to the use of the Standard sku
  sku                 = "Standard" # the Standard sku is required due to the use of availability zones
}
resource "azurerm_public_ip" "external_pubip_3" {
  name                = "bigip-external_pubip_3"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"   # Static is required due to the use of the Standard sku
  sku                 = "Standard" # the Standard sku is required due to the use of availability zones
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "management_nsg" {
  name                = "bigip-mgmt-NSG"
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

resource "azurerm_network_security_group" "external_nsg" {
  name                = "bigip-external-NSG"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "MultiPort-Access"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["22", "80", "8080", "443", "8443"]
    source_address_prefixes    = var.REtrafficSrcAddr
    destination_address_prefix = "*"
  }
  tags = {
    owner = var.resourceOwner
  }  
}
resource "azurerm_network_security_group" "internal_nsg" {
  name                = "bigip-internal-NSG"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = {
    owner = var.resourceOwner
  }
}  

# Create network interface
resource "azurerm_network_interface" "management_nic" {
  name                = "bigip-management-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "bigip-managenment_nic_configuration"
    subnet_id                     = var.mgmt_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.management_pubip.id
  }
}

resource "azurerm_network_interface" "external_nic" {
  name                  = "bigip-external-nic"
  location              = var.location
  resource_group_name   = var.resource_group_name
  enable_ip_forwarding  = true

  ip_configuration {
    name                          = "bigip-external_nic_configuration"
    subnet_id                     = var.ext_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.external_pubip.id
    primary                       = true
  }

  ip_configuration {
    name                          = "bigip-external_nic_configuration_2"
    subnet_id                     = var.ext_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.external_pubip_2.id
  }
    ip_configuration {
    name                          = "bigip-external_nic_configuration_3"
    subnet_id                     = var.ext_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.external_pubip_3.id
  }
}

resource "azurerm_network_interface" "internal_nic" {
  name                = "bigip-internal-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "bigip-internal_nic_configuration"
    subnet_id                     = var.int_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "mgmt" {
  network_interface_id      = azurerm_network_interface.management_nic.id
  network_security_group_id = azurerm_network_security_group.management_nsg.id
}

resource "azurerm_network_interface_security_group_association" "external" {
  network_interface_id      = azurerm_network_interface.external_nic.id
  network_security_group_id = azurerm_network_security_group.external_nsg.id
}

resource "azurerm_network_interface_security_group_association" "internal" {
  network_interface_id      = azurerm_network_interface.internal_nic.id
  network_security_group_id = azurerm_network_security_group.internal_nsg.id
}
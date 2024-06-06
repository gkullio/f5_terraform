resource "azurerm_resource_group" "rg" {
    name                 = var.rg_name
    location             = var.location
}

module "azure-vnet" {
    source              = "./modules/azure-vnet"
    resource_group_name = azurerm_resource_group.rg.name
    location            = var.location
    vnet_name           = var.vnet_name
    vnet_address_space  = var.vnet_address_space
    mgmt_subnet_name    = var.mgmt_subnet_name
    mgmt_address_space  = var.mgmt_address_space
    ext_subnet_name     = var.ext_subnet_name
    ext_address_space   = var.ext_address_space
    int_subnet_name     = var.int_subnet_name
    int_address_space   = var.int_address_space
}

module "bigip" {
    source              = "./modules/bigip"
    resource_group_name = azurerm_resource_group.rg.name
    location            = var.location
    resourceOwner       = var.resourceOwner
    adminSrcAddr        = var.vpnMgmtSrcAddr
    REtrafficSrcAddr    = var.REtrafficSrcAddr
    vm_name             = var.vm_name
    mgmt_subnet_id      = module.azure-vnet.mgmt_subnet_id
    ext_subnet_id       = module.azure-vnet.ext_subnet_id
    int_subnet_id       = module.azure-vnet.int_subnet_id
    instance_prefix     = var.instance_prefix

    # BIG-IP VE variables
    bigip-hostname      = var.bigip-hostname
    bigip-username      = var.bigip-username
    bigip-password      = var.bigip-password
    ssh_publickey       = var.ssh_publickey
    instance_size       = var.instance_size
    f5_product_name     = var.f5_product_name
    f5_image_name       = var.f5_image_name
    f5_version          = var.f5_version
    f5_username         = var.f5_username
    f5_username_2       = var.f5_username_2
    f5_password         = var.f5_password
    dns_suffix          = var.dns_suffix
    dns_server          = var.dns_server
    availability_zone   = var.availability_zone
    ntp_server          = var.ntp_server
    timezone            = var.timezone
    script_name         = var.script_name
    enable_ssh_key      = var.enable_ssh_key 
    DO_URL              = var.DO_URL    
    AS3_URL             = var.AS3_URL   
    TS_URL              = var.TS_URL    
    FAST_URL            = var.FAST_URL  
    INIT_URL            = var.INIT_URL  
    CFE_URL             = var.CFE_URL  
}

module "ubuntu" {
    source              = "./modules/ubuntu"
    mgmt_subnet_id      = module.azure-vnet.mgmt_subnet_id
    int_subnet_id       = module.azure-vnet.int_subnet_id
    instance_size       = var.instance_size
    ubuntu-hostname     = var.ubuntu-hostname
    resourceOwner       = var.resourceOwner
    ubuntu-username     = var.ubuntu-username
    ubuntu-password     = var.ubuntu-password
    adminSrcAddr        = var.vpnMgmtSrcAddr
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
}
# Azure Credentials
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
variable "subscription_id" {}

# Global Variables
variable "rg_name" {}
variable "resourceOwner" {}
variable "location" {}
variable "instance_size" {}


####### Module azure_vnet #######

variable "vnet_name" {}
variable "vnet_address_space" {}
variable "mgmt_subnet_name" {}
variable "mgmt_address_space" {}
variable "ext_subnet_name" {}
variable "ext_address_space" {}
variable "int_subnet_name" {}
variable "int_address_space" {}

####### Module BIG-IP VM #######

variable "vm_name" {}
variable "instance_prefix" {}
variable "bigip-username" {}
variable "bigip-password" {}

####### Networking source address lists  #######

variable "vpnMgmtSrcAddr" {}
variable "REtrafficSrcAddr" {}

# BIG-IP VE specific variables
variable "bigip-hostname" {}
variable "ssh_publickey" {}
variable "f5_product_name" {}
variable "f5_image_name" {}
variable "f5_version" {}
variable "f5_username" {}
variable "f5_username_2" {}
variable "dns_suffix" {}
variable "dns_server" {}
variable "availability_zone" {}
variable "ntp_server" {}
variable "timezone" {}
variable "f5_password" {}
variable "script_name" {}
variable "enable_ssh_key" {}
variable "DO_URL" {}
variable "AS3_URL" {}
variable "TS_URL" {}
variable "FAST_URL" {}
variable "INIT_URL" {}
variable "CFE_URL" {}


####### Module Ubuntu #######
variable "ubuntu-hostname" {}
variable "ubuntu-username" {}
variable "ubuntu-password" {}

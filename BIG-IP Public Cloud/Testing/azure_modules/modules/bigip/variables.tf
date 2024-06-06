variable "resource_group_name" {}
variable "location" {}
variable "resourceOwner" {}
variable "adminSrcAddr" {
  type        = list(string)
}
variable "REtrafficSrcAddr" {
  type        = list(string)  
}
variable "vm_name" {}
variable "mgmt_subnet_id" {}
variable "ext_subnet_id" {}
variable "int_subnet_id" {}
variable "instance_prefix" {}

variable "ssh_publickey" {}
variable "bigip-hostname" {}
variable "bigip-username" {}
variable "bigip-password" {}

variable "instance_size" {}
variable "DO_URL" {}
variable "AS3_URL" {}
variable "TS_URL" {}
variable "FAST_URL" {}
variable "INIT_URL" {}
variable "CFE_URL" {}

variable "libs_dir" {
  description = "Directory on the BIG-IP to download the A&O Toolchain into"
  default     = "/config/cloud/azure/node_modules"
  type        = string
}
variable "enable_ssh_key" {
  type        = bool
  description = "(Optional) Enable ssh key authentication in Linux virtual Machine"
  default     = false
}
variable "custom_user_data" {
  description = "Provide a custom bash script or cloud-init script the BIG-IP will run on creation"
  type        = string
  default     = null
}
variable "script_name" {
  default = "f5_onboard"
}

variable "image_publisher" {
  description = "Specifies product image publisher this will never change with an F5 image"
  type        = string
  default     = "f5-networks"
}

variable "f5_image_name" {
  type        = string
  default     = "f5-big-best-plus-hourly-25mbps"
  description = <<-EOD
After finding the image to use with the Azure CLI with a variant of the following;

az vm image list --publisher f5-networks --all -f better

{
    "offer": "f5-big-ip-better",
    "publisher": "f5-networks",
    "sku": "f5-bigip-virtual-edition-25m-better-hourly",
    "urn": "f5-networks:f5-big-ip-better:f5-bigip-virtual-edition-25m-better-hourly:14.1.404001",
    "version": "14.1.404001"
}

f5_image_name is equivalent to the "sku" returned.
EOD  
}
variable "f5_version" {
  type        = string
  default     = "latest"
  description = <<-EOD
After finding the image to use with the Azure CLI with a variant of the following;

az vm image list --publisher f5-networks --all -f better

{
    "offer": "f5-big-ip-better",
    "publisher": "f5-networks",
    "sku": "f5-bigip-virtual-edition-25m-better-hourly",
    "urn": "f5-networks:f5-big-ip-better:f5-bigip-virtual-edition-25m-better-hourly:14.1.404001",
    "version": "14.1.404001"
}

f5_version is equivalent to the "version" returned.
EOD  
}

variable "f5_product_name" {
  type        = string
  default     = "f5-big-ip-best"
  description = <<-EOD
After finding the image to use with the Azure CLI with a variant of the following;

az vm image list --publisher f5-networks --all -f better

{
    "offer": "f5-big-ip-better",
    "publisher": "f5-networks",
    "sku": "f5-bigip-virtual-edition-25m-better-hourly",
    "urn": "f5-networks:f5-big-ip-better:f5-bigip-virtual-edition-25m-better-hourly:14.1.404001",
    "version": "14.1.404001"
}

f5_product_name is equivalent to the "offer" returned.
EOD  
}

variable "storage_account_type" {
  description = "Defines the type of storage account to be created. Valid options are Standard_LRS, Standard_ZRS, Standard_GRS, Standard_RAGRS, Premium_LRS."
  default     = "Standard_LRS"
}


variable "availability_zone" {
  description = "If you want the VM placed in an Azure Availability Zone, and the Azure region you are deploying to supports it, specify the number of the existing Availability Zone you want to use."
  default     = 1
}

variable "dns_server" {
  description = "The DNS server to use for the VM."
}
variable "dns_suffix" {
  description = "The DNS suffix to use for the VM."  
}
variable "ntp_server" {
  description = "The NTP server to use for the VM."
}
variable "timezone" {
  type        = string
  default     = "UTC"
  description = "If you would like to change the time zone the BIG-IP uses, enter the time zone you want to use. This is based on the tz database found in /usr/share/zoneinfo (see the full list [here](https://github.com/F5Networks/f5-azure-arm-templates/blob/master/azure-timezone-list.md)). Example values: UTC, US/Pacific, US/Eastern, Europe/London or Asia/Singapore."
}
variable "f5_username" {
  type        = string
  description = "The username for the BIG-IP VE."  
}
variable "f5_password" {
  type        = string
  description = "The password for the BIG-IP VE."  
}
variable "f5_username_2" {
  type        = string
  description = "The username for the BIG-IP VE."  
}
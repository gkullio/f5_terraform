#### NOTE ####
# All variables are defined in the variables.tf file.  
#This file is used to define the variables and their descriptions.  
#The values for the variables are defined in the terraform.tfvars file.  
#The terraform.tfvars file is not included in this repository for security reasons.  
#The terraform.tfvars file should be created in the same directory as the variables.tf file.  
#The terraform.tfvars file should contain the following variables and their values.
#### End of NOTE ####

# Variables
variable "adminSrcAddr" {
  type        = string
  description = "Allowed Admin source IP prefix"
  #Recommend using icanhazip.com to get your public IP address
  #Recommend against 0.0.0.0/0 for security reasons  
}
variable "vnet_cidr" {
  type        = string
  description = "CIDR IP Address range of the Virtual Network"
}
variable "mgmt_address_prefix" {
  type        = string
  description = "Management subnet address prefix"
}
variable "ext_address_prefix" {
  type        = string
  description = "External subnet address prefix"
}
variable "int_address_prefix" {
  type        = string
  description = "Internal subnet address prefix"
}
variable "projectPrefix" {
  type        = string
  description = "This value is inserted at the beginning of each Azure object (alpha-numeric, no special character)"
}
variable "location" {
  type        = string
  description = "Azure Location of the deployment"
}
variable "availability_zone" {
  type        = number
  description = "Azure Availability Zone for BIG-IP 1"
}
variable "client_secret" {
  type        = string
  description = "This is the client secret for the Service Principal"
}
variable "client_id" {
  type        = string
  description = "This is the client id for the Service Principal"
}
variable "tenant_id" {
  type        = string
  description = "This is the tenant id for the Service Principal"
}
variable "subscription_id" {
  type        = string
  description = "This is the subscription id for the Service Principal"
}
variable "instance_type" {
  type        = string
  default     = "Standard_DS4_v2"
  description = "Azure instance type to be used for the BIG-IP VE"
}
variable "image_name" {
  type        = string
  description = "F5 SKU (image) to deploy. Note: The disk size of the VM will be determined based on the option you select.  **Important**: If intending to provision multiple modules, ensure the appropriate value is selected, such as ****AllTwoBootLocations or AllOneBootLocation****."
}
variable "product" {
  type        = string
  description = "Azure BIG-IP VE Offer"
}
variable "bigip_version" {
  type        = string
  description = "BIG-IP Version"
}
variable "f5_username" {
  type        = string
  description = "User name for the BIG-IP"
}
variable "f5_password" {
  type        = string
  description = "BIG-IP Password or Key Vault secret name (value should be Key Vault secret name when az_key_vault_authentication = true, ex. my-bigip-secret)"
}
variable "az_keyvault_authentication" {
  type        = bool
  description = "Whether to use key vault to pass authentication"
}
variable "keyvault_rg" {
  type        = string
  description = "The name of the resource group in which the Azure Key Vault exists"
}
variable "keyvault_name" {
  type        = string
  description = "Name of Key Vault"
}
variable "keyvault_secret" {
  type        = string
  description = "Name of Key Vault secret with BIG-IP password"
}
variable "user_identity" {
  type        = string
  description = "The ID of the managed user identity to assign to the BIG-IP instance"
}
variable "ssh_key" {
  type        = string
  description = "public key used for authentication in /path/file format (e.g. /.ssh/id_rsa.pub)"
}
variable "dns_server" {
  type        = string
  description = "Leave the default DNS server the BIG-IP uses, or replace the default DNS server with the one you want to use"
}
variable "dns_suffix" {
  type        = string
  description = "DNS suffix for your domain in the GCP project"
}
variable "ntp_server" {
  type        = string
  description = "Leave the default NTP server the BIG-IP uses, or replace the default NTP server with the one you want to use"
}
variable "timezone" {
  type        = string
  default     = "UTC"
  description = "If you would like to change the time zone the BIG-IP uses, enter the time zone you want to use. This is based on the tz database found in /usr/share/zoneinfo (see the full list [here](https://github.com/F5Networks/f5-azure-arm-templates/blob/master/azure-timezone-list.md)). Example values: UTC, US/Pacific, US/Eastern, Europe/London or Asia/Singapore."
}
variable "DO_URL" {
  type        = string
  description = "URL to download the BIG-IP Declarative Onboarding module"
}
variable "AS3_URL" {
  type        = string
  description = "URL to download the BIG-IP Application Service Extension 3 (AS3) module"
}
variable "TS_URL" {
  type        = string
  description = "URL to download the BIG-IP Telemetry Streaming module"
}
variable "FAST_URL" {
  type        = string
  description = "URL to download the BIG-IP FAST module"
}
variable "INIT_URL" {
  type        = string
  description = "URL to download the BIG-IP runtime init"
}
variable "libs_dir" {
  type        = string
  description = "Directory on the BIG-IP to download the A&O Toolchain into"
}
variable "resourceOwner" {
  type        = string
  default     = null
  description = "This is a tag used for object creation. Example is last name."
}
variable "resourceOwnerEmail" {
  type        = string
  default     = null
  description = "This is a tag used for object creation. Example is email address."  
}
variable "vm_name" {
  description = "Name of 1st BIG-IP. If empty, default is 'bigip1' string + prefix + random_id"
}
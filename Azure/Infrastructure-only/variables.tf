#### NOTE ####
# All variables are defined in the variables.tf file.  
#This file is used to define the variables and their descriptions.  
#The values for the variables are defined in the terraform.tfvars file.  
#The terraform.tfvars file is not included in this repository for security reasons.  
#The terraform.tfvars file should be created in the same directory as the variables.tf file.  
#The terraform.tfvars file should contain the following variables and their values.
#### End of NOTE ####

# Variables

variable "projectPrefix" {
  type        = string
  description = "This value is inserted at the beginning of each Azure object (alpha-numeric, no special character)"
}
variable "location" {
  type        = string
  description = "Azure Location of the deployment"
}
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
variable "resourceOwner" {
  type        = string
  description = "This is a tag used for object creation. Example is last name."
}
variable "f5_cloud_failover_label" {
  type        = string
  default     = "myFailover"
  description = "This is a tag used for F5 Cloud Failover Extension to identity which cloud objects to move during a failover event."
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
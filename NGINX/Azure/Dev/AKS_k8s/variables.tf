###### Tag variables ######
variable "environment" {}
variable "email" {}
variable "owner" {}

###### Global Variables ######
variable "resource_group_name"  {}
variable "location"  {}

###### Azure Credentials ######
variable "client_id"  {}
variable "client_secret"  {}
variable "tenant_id"  {}
variable "subscription_id"  {}

###### AKS Variables ######
variable "aks_version" {}
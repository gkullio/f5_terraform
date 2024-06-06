variable "vnet_name" {
  description = "VNet name"
  type        = string
}
variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}
variable "location" {
  description = "Azure region"
  type        = string
}
variable "vnet_address_space" {
  description = "VNet address space"
  type        = string
}
variable "mgmt_subnet_name" {
  description = "Management subnet name"
  type        = string
}
variable "mgmt_address_space" {
  description = "Management subnet address prefix"
  type        = string
}
variable "ext_subnet_name" {
  description = "External subnet name"
  type        = string
}
variable "ext_address_space" {
  description = "External subnet address prefix"
  type        = string
}
variable "int_subnet_name" {
  description = "Internal subnet name"
  type        = string
}
variable "int_address_space" {
  description = "Internal subnet address prefix"
  type        = string
}
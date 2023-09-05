# Variables

variable "projectPrefix" {
  type        = string
  default     = "Kulland-HA-ALB-"
  description = "This value is inserted at the beginning of each Azure object (alpha-numeric, no special character)"
}
variable "location" {
  type        = string
  default     = "westus2"
  description = "Azure Location of the deployment"
}
variable "adminSrcAddr" {
  type        = string
  description = "Allowed Admin source IP prefix"
  default     = "65.61.116.107/32"
}
variable "vnet_cidr" {
  type        = string
  default     = "10.245.0.0/16"
  description = "CIDR IP Address range of the Virtual Network"
}
variable "mgmt_address_prefix" {
  type        = string
  default     = "10.245.1.0/24"
  description = "Management subnet address prefix"
}
variable "ext_address_prefix" {
  type        = string
  default     = "10.245.2.0/24"
  description = "External subnet address prefix"
}
variable "int_address_prefix" {
  type        = string
  default     = "10.245.3.0/24"
  description = "Internal subnet address prefix"
}
variable "resourceOwner" {
  type        = string
  default     = "kulland"
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
####################################
## Application Module - Variables ##
####################################

# Application definition

variable "name" {
  type        = string
  description = "Application name"
  default     = "g-kulland-demo"
}

variable "environment" {
  type        = string
  description = "Application environment"
  default     = "demonstration"
}

variable "adminUserName" {
  type        = string
  description = "REQUIRED: Admin Username for All systems"
  default     = "xadmin"
}

variable "sshPublicKey" {
  type        = string
  description = "OPTIONAL: ssh public key for instances"
  default     = ""
}
variable "sshPublicKeyPath" {
  type        = string
  description = "OPTIONAL: ssh public key path for instances"
  default     = "~/.ssh/id_rsa.pub"
}



########################
## F5 XCS Variables   ##
########################

// Required Variable
variable "api_p12_file" {
  type        = string
  description = "REQUIRED:  This is the path to the Volterra API Key.  See https://volterra.io/docs/how-to/user-mgmt/credentials"
  default     = "api.p12"
}

variable "api_cert" {
  type        = string
  description = "REQUIRED:  This is the path to the Volterra API Key.  See https://volterra.io/docs/how-to/user-mgmt/credentials"
  default     = "api.p12"
}
variable "api_key" {
  type        = string
  description = "REQUIRED:  This is the path to the Volterra API Key.  See https://volterra.io/docs/how-to/user-mgmt/credentials"
  default     = "api.p12"
}
// Required Variable
variable "tenant_name" {
  type        = string
  description = "REQUIRED:  This is your Volterra Tenant Name:  https://<tenant_name>.console.ves.volterra.io/api"
  default     = "f5-amer-ent"
}
// Required Variable
variable "namespace" {
  type        = string
  description = "REQUIRED:  This is your Volterra App Namespace"
  default     = "g-kulland"
}
variable "delegated_dns_domain" {
  default = "amer-ent.f5demos.com"
}
// Required Variable
variable "api_url" {
  type        = string
  description = "REQUIRED:  This is your Volterra API url"
  default     = "https://f5-amer-ent.console.ves.volterra.io/api"
}
variable "fleet_label" { 
  default = "fleet_label" 
}

variable "instance_type" {
  description = "XCS EC2 node instance type"
  type        = string
  default     = "t3.xlarge"
}

## TAGS
variable "tags" {
  description = "Environment tags for objects"
  type        = map(string)
  default = {
    purpose     = "public"
    environment = "aws"
    owner       = "f5owner"
    group       = "f5group"
    costcenter  = "f5costcenter"
    application = "f5app"
    creator     = "Terraform"
    delete      = "True"
  }
}

########################
## Count Example Var  ##
########################
# Do not use unless you intend to load test API, expect 429s if set too high.  Setting too high will exceed LB and Route Quotas.
variable "lb_count" {
  type        = number
  description = "How many Load Balancers to Create"
  default     = 1
}

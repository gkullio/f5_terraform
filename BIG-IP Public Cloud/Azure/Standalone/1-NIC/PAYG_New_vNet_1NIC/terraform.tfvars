# BIG-IP Environment
f5_username         = "kulland"
f5_password         = "WOLF0359"
ssh_key             = "~/.ssh/id_rsa.pub"
libs_dir            = "/config/cloud/azure/node_modules"
dns_suffix          = "kulland.1nic.demo"
dns_server          = "8.8.8.8"
availability_zone   = 1
ntp_server          = "0.us.pool.ntp.org"
DO_URL              = "https://github.com/F5Networks/f5-declarative-onboarding/releases/download/v1.39.0/f5-declarative-onboarding-1.39.0-4.noarch.rpm"
AS3_URL             = "https://github.com/F5Networks/f5-appsvcs-extension/releases/download/v3.46.0/f5-appsvcs-3.46.0-5.noarch.rpm"
TS_URL              = "https://github.com/F5Networks/f5-telemetry-streaming/releases/download/v1.32.0/f5-telemetry-1.32.0-2.noarch.rpm"
FAST_URL            = "https://github.com/F5Networks/f5-appsvcs-templates/releases/download/v1.24.0/f5-appsvcs-templates-1.24.0-1.noarch.rpm"
INIT_URL            = "https://cdn.f5.com/product/cloudsolutions/f5-bigip-runtime-init/v1.6.0/dist/f5-bigip-runtime-init-1.6.0-1.gz.run"
vm_name             = "kulland-ipsec-vm"

# BIG-IP Image Information
# --Currently used PAYG image--
product             = "f5-big-ip-best"
image_name          = "f5-big-best-plus-hourly-25mbps"
bigip_version       = "17.1.100002"

# new vNet information
#adminSrcAddr        = "98.247.105.105"
#vnet_cidr           = "10.245.0.0/16"
#mgmt_address_prefix = "10.245.1.0/24"
#ext_address_prefix  = "10.245.2.0/24"
#int_address_prefix  = "10.245.3.0/24"

# new vNet information
adminSrcAddr        = "104.219.105.84"
vnet_cidr           = "172.10.0.0/16"
mgmt_address_prefix = "172.10.1.0/24"
ext_address_prefix  = "172.10.2.0/24"
int_address_prefix  = "172.10.3.0/24"


# Azure Environment
location           = "westus2"
projectPrefix      = "kulland-1nic-test"
resourceOwner      = "Gage Kulland"
resourceOwnerEmail = "g.kulland@f5.com"

# main.tf Azure Credentials
client_id       = "12d8200d-b9ae-40d7-b30c-b6aa6106eae4"
client_secret   = "js48Q~8ooRgIAAK.-bhHrYROKEwCKJ5jmunUTcg2"
tenant_id       = "e569f29e-b098-4cea-b6f0-48fa8532d64a"
subscription_id = "9352346c-785d-48d8-ac70-ade86a830db8"

# Key Vault - Uncomment to use Key Vault integration
#az_keyvault_authentication = true
az_keyvault_authentication = false
keyvault_rg                = "Kulland-rg-1fbb"
keyvault_name              = "kulland-rg-key"
user_identity              = "/subscriptions/9352346c-785d-48d8-ac70-ade86a830db8/resourceGroups/Kulland-rg-1fbb/providers/Microsoft.ManagedIdentity/userAssignedIdentities/idKulland"
keyvault_secret            = "IL1k32m0ve1tm0ve1t"
output "BIG-IP-WebUI-URL" {
    value = "https://${module.bigip.management_public_ip}"
}
output "BIG-IP-SSH" {
    value = "ssh admin@${module.bigip.management_public_ip}"
}
output "HTTPS-Application-URL" {
    value = "https://${module.bigip.application_ip_1}"
}
output "HTTP-Application-URL" {
    value = "http://${module.bigip.application_ip_1}"
}
output bigip_application_ip_2 {
    value = module.bigip.application_ip_2
}
output application_ip_1_private {
    value = module.bigip.application_ip_1_private
}
output application_ip_2_private {
    value = module.bigip.application_ip_2_private
    }

output ubuntu_public_ip {
    value = module.ubuntu.management_public_ip_address
}
output ubuntu_public_ip_different_resource {
    value = module.ubuntu.management_public_ip_address_different_resource
}
# print the IP addresses of the VMs
output "rhel10_ips" {
  value = libvirt_domain.rhel10.*.network_interface.0.addresses
}

output "rhel9_ips" {
  value = libvirt_domain.rhel9.*.network_interface.0.addresses
}

output "alma9_ips" {
  value = libvirt_domain.alma9.*.network_interface.0.addresses
}
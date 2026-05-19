# output "default-vm_ips" {
    # value = libvirt_domain.rhel9[*].network_interface[0].addresses[0]
# }

output "default-vm_ips" {
  value = length(libvirt_domain.rhel9) > 0 ? libvirt_domain.rhel9[*].network_interface[0].addresses[0] : []
}
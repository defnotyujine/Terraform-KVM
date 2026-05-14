output "default-vm_ips" {
    value = libvirt_domain.rhel9[*].network_interface[0].addresses[0]
}
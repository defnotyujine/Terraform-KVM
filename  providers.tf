terraform {
    required_providers {
        libvirt = {
            source = "dmacvicar/libvirt"
            version = "0.7.6" 
        }
    }
}

# provider "libvirt" {
#     # change based on KVM server credentials
#     uri = "qemu+ssh://frqadmin@192.168.8.211/system"
# }

provider "libvirt" {
  uri = "qemu+ssh://frqadmin@192.168.122.1/system?keyfile=/var/lib/jenkins/.ssh/id_ed25519&no_verify=1"
}
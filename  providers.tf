terraform {
    required_providers {
        libvirt = {
            source = "dmacvicar/libvirt"
            version = "0.7.6" 
        }
    }
}

provider "libvirt" {
    # change based on KVM server credentials
    uri = "qemu+ssh://vvolf@192.168.1.1/system"
}
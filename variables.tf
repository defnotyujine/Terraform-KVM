variable "rhel10_config" {
  description = "Configuration settings for RHEL 10 virtual machine"
  type = object({
    name      = string
    cpu_count = number
    ram_mb    = number
    disk_path = string
    format    = string
    vm_count  = number
  })

  default = {
    name      = "rhel10_vm"
    cpu_count = 2
    ram_mb    = 2048
    disk_path = "var/lib/libvirt/images/rhel10.qcow2"
    format    = "qcow2"
    vm_count  = 3
  }
}


variable "rhel9_config" {
  description = "Configuration settings for RHEL 9 virtual machine"
  type = object({
    name      = string
    cpu_count = number
    ram_mb    = number
    disk_path = string
    format    = string
    vm_count  = number
  })

  default = {
    name      = "rhel9_vm"
    cpu_count = 2
    ram_mb    = 2048
    disk_path = "/var/lib/libvirt/images/rhel9.qcow2" # name of VM in directory
    format    = "qcow2"
    vm_count  = 3
  }
}


variable "alma9_config" {
  description = "Configuration settins for Alma 9 virtual machine"
  type = object({
    name      = string
    cpu_count = number
    ram_mb    = number
    disk_path = string
    format    = string
    vm_count  = number
  })

  default = {
    name      = "alma9_vm"
    cpu_count = 2
    ram_mb    = 2048
    disk_path = "/var/lib/libvirt/images/alma9.qcow2"
    format    = "qcow2"
    vm_count  = 3
  }
}

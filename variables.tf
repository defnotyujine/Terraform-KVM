variable "rhel10_config" {
  description = "Configuration settings for RHEL 10 virtual machine"
  type = object({
    name              = string
    cpu_count         = number
    cpu_mode          = string
    ram_mb            = number
    disk_path         = string
    format            = string
    vm_count          = number
    base_volume_name  = string
    machine           = string
    type              = string
    arch              = string
  })
  default = {
    name              = "rhel10_vm"
    cpu_count         = 2
    cpu_mode          = "host-passthrough"
    ram_mb            = 4096
    disk_path         = "/var/lib/libvirt/images/rhel10.0.qcow2"
    format            = "qcow2"
    vm_count          = 2
    base_volume_name  = "rhel10.0.qcow2"
    machine           = "pc-q35-9.2"
    type              = "kvm"
    arch              = "x86_64"
  }
}

# -----

variable "rhel9_config" {
  description = "Configuration settings for RHEL 9 virtual machine"
  type = object({
    name              = string
    cpu_count         = number
    cpu_mode          = string
    ram_mb            = number
    disk_path         = string
    format            = string
    vm_count          = number
    base_volume_name  = string
    machine           = string
    type              = string
    arch              = string
  })
  default = {
    name              = "rhel9_vm"
    cpu_count         = 2
    cpu_mode          = "host-passthrough"
    ram_mb            = 4096
    disk_path         = "/var/lib/libvirt/images/rhel9.qcow2" # name of VM in directory
    format            = "qcow2"
    vm_count          = 2
    base_volume_name  = "rhel9.qcow2"
    machine           = "pc-q35-9.2"
    type              = "kvm"
    arch              = "x86_64"
  }
}

# -----

variable "alma10_config" {
  description = "Configuration settings for Alma 10 virtual machine"
  type = object({
    name              = string
    cpu_count         = number
    cpu_mode          = string
    ram_mb            = number
    disk_path         = string
    format            = string
    vm_count          = number
    base_volume_name  = string
    machine           = string
    type              = string
    arch              = string
  })
  default = {
    name              = "alma10_vm"
    cpu_count         = 2
    cpu_mode          = "host-passthrough"
    ram_mb            = 4096
    disk_path         = "/var/lib/libvirt/images/AlmaLinux_10.qcow2"
    format            = "qcow2"
    vm_count          = 2
    base_volume_name  = "AlmaLinux_10.qcow2"
    machine           = "pc-q35-9.2"
    type              = "kvm"
    arch              = "x86_64"
  }
}

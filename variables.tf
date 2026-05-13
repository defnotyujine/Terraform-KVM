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
    target_pool       = string
    source_pool       = string
  })
  default = {
    name              = "rhel9_terraform_vm"
    cpu_count         = 2
    cpu_mode          = "host-passthrough"
    ram_mb            = 4096
    disk_path         = "/mnt/kvm_storage1/rhel9_1" # name of VM in directory
    format            = "qcow2"
    vm_count          = 2
    base_volume_name  = "rhel9_1"
    machine           = "pc-q35-rhel9.6.0"
    type              = "kvm"
    arch              = "x86_64"
    target_pool       = "kvmDatastore_qcow2_1"
    source_pool       = "kvmDatastore_qcow2_1"
  }
}

variable "vm_count" {
  description = "Number of VMs to provision"
  type        = number
  default     = 2
}

variable "rhel9_config" {
  description = "Configuration settings for RHEL 9 virtual machine"
  type = object({
    name              = string
    cpu_count         = number
    ram_mb            = number
    base_volume_name  = string
    machine           = string
    target_pool       = string
    source_pool       = string
  })
  default = {
    name              = "rhel9_terraform_vm"
    cpu_count         = 2
    ram_mb            = 4096
    base_volume_name  = "rhel9_1"
    machine           = "pc-q35-rhel9.6.0"
    target_pool       = "kvmDatastore_qcow2_1" # Where to put the created VMs
    source_pool       = "kvmDatastore_qcow2_1" # Source pool of the golden image source
  }
}

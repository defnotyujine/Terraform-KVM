resource "libvirt_volume" "rhel9_disk" {
  count            = var.rhel9_config.vm_count
  name             = "${var.rhel9_config.name}-${count.index}.qcow2"
  pool             = var.rhel9_config.target_pool
  base_volume_name = var.rhel9_config.base_volume_name
  base_volume_pool = var.rhel9_config.source_pool
  format           = var.rhel9_config.format
}

# VMs
resource "libvirt_domain" "rhel9" {
  count   = var.rhel9_config.vm_count
  name    = "${var.rhel9_config.name}-${count.index}"
  vcpu    = var.rhel9_config.cpu_count
  memory  = var.rhel9_config.ram_mb
  arch    = var.rhel9_config.arch
  type    = var.rhel9_config.type
  machine = var.rhel9_config.machine
  firmware = "/usr/share/edk2/ovmf/OVMF_CODE.secboot.fd"

  nvram {
    file     = "/var/lib/libvirt/qemu/nvram/${var.rhel9_config.name}-${count.index}_VARS.fd"
    template = "/usr/share/edk2/ovmf/OVMF_VARS.secboot.fd"
  }

  cpu {
    mode = var.rhel9_config.cpu_mode
  }

  graphics {
    type        = "vnc"
    listen_type = "address"
    autoport    = true
  }

  disk {
    volume_id = libvirt_volume.rhel9_disk[count.index].id
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  network_interface {
    network_name    = "default"
    wait_for_lease  = true
  }

  # BR-FDS bridge
  network_interface {
    bridge         = "BR-FDS"
    wait_for_lease = false
  }

  # Direct attach on eno1
  network_interface {
    macvtap        = "eno1"
    wait_for_lease = false
  }
}

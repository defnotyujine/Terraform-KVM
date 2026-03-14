# Storage Volumes
resource "libvirt_volume" "rhel10_disk" {
  count            = var.rhel10_config.vm_count
  name             = "${var.rhel10_config.name}-${count.index}.qcow2"
  pool             = "default"
  base_volume_name = var.rhel10_config.base_volume_name
  base_volume_pool = "default"
  format           = var.rhel10_config.format
}

# VMs
resource "libvirt_domain" "rhel10" {
  count   = var.rhel10_config.vm_count
  name    = "${var.rhel10_config.name}-${count.index}"
  vcpu    = var.rhel10_config.cpu_count
  memory  = var.rhel10_config.ram_mb
  arch    = var.rhel10_config.arch
  type    = var.rhel10_config.type
  machine = var.rhel10_config.machine

  cpu {
    mode = var.rhel10_config.cpu_mode
  }

  disk {
    volume_id = libvirt_volume.rhel10_disk[count.index].id
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  network_interface {
    network_name    = "default"
    wait_for_lease  = false
  }

# For VNC graphical consoles
  graphics {
    type          = "vnc"
    listen_type   = "address"
    autoport      = true
  }
}

# -----

resource "libvirt_volume" "rhel9_disk" {
  count            = var.rhel9_config.vm_count
  name             = "${var.rhel9_config.name}-${count.index}.qcow2"
  pool             = "default"
  base_volume_name = var.rhel9_config.base_volume_name
  base_volume_pool = "default"
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

  cpu {
    mode = var.rhel9_config.cpu_mode
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
    wait_for_lease  = false
  }
}

# -----

resource "libvirt_volume" "alma10_disk" {
  count            = var.alma10_config.vm_count
  name             = "${var.alma10_config.name}-${count.index}.qcow2"
  pool             = "default"
  base_volume_name = var.alma10_config.base_volume_name
  base_volume_pool = "default"
  format           = var.alma10_config.format
}

# VMs
resource "libvirt_domain" "alma10" {
  count   = var.alma10_config.vm_count
  name    = "${var.alma10_config.name}-${count.index}"
  vcpu    = var.alma10_config.cpu_count
  memory  = var.alma10_config.ram_mb
  arch    = var.alma10_config.arch
  type    = var.alma10_config.type
  machine = var.alma10_config.machine

  cpu {
    mode = var.alma10_config.cpu_mode
  }

  disk {
    volume_id = libvirt_volume.alma10_disk[count.index].id
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  network_interface {
    network_name    = "default"
    wait_for_lease  = false
  }
}
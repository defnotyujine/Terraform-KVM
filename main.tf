# Storage Volumes
resource "libvirt_volume" "rhel10_disk" {
  count   = var.rhel10_config.vm_count
  name    = "${var.rhel10_config.name}-${count.index}.qcow2"
  pool    = "default" # change if storage pool has a different name
  source  = var.rhel10_config.disk_path
  format  = var.rhel10_config.format
}

# VM
resource "libvirt_domain" "rhel10" {
  count   = var.rhel10_config.vm_count

  name    = "${var.rhel10_config.name}-${count.index}"
  vcpu    = var.rhel10_config.cpu_count
  memory  = var.rhel10_config.ram_mb

  disk {
    volume_id = libvirt_volume.rhel10_disk[count.index].id
  }

  network_interface {
    network_name = "default" # connects to bridge/nat
    wait_for_lease = true # tells terraform to do not finish apply until VM has an IP 
  }
}


resource "libvirt_volume" "rhel9_disk" {
  count   = var.rhel9_config.vm_count
  name    = "${var.rhel9_config.name}-${count.index}.qcow2"
  pool    = "default"
  source  = var.rhel9_config.disk_path
  format  = var.rhel9_config.format
}

resource "libvirt_domain" "rhel9" {
  count   = var.rhel9_config.vm_count

  name    = "${var.rhel9_config.name}-${count.index}"
  vcpu    = var.rhel9_config.cpu_count
  memory  = var.rhel9_config.ram_mb

  disk {
    volume_id = libvirt_volume.rhel9_disk[count.index].id
  }

  network_interface {
    network_name = "default"
    wait_for_lease = true
  }
}


resource "libvirt_volume" "alma9_disk" {
  count   = var.alma9_config.vm_count
  name    = "${var.alma9_config.name}-${count.index}.qcow2"
  pool    = "default"
  source  = var.alma9_config.disk_path
  format  = var.alma9_config.format
}

resource "libvirt_domain" "alma9" {
  count   = var.alma9_config.vm_count

  name    = "${var.alma9_config.name}-${count.index}"
  vcpu    = var.alma9_config.cpu_count
  memory  = var.alma9_config.ram_mb

  disk {
    volume_id = libvirt_volume.alma9_disk[count.index].id
  }

  network_interface {
    network_name = "default"
    wait_for_lease = true
  }
}
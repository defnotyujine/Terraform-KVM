# Terraform KVM VM Provisioning

Automates provisioning of RHEL 10, RHEL 9, and AlmaLinux 10 virtual machines on a KVM hypervisor using the `dmacvicar/libvirt` Terraform provider.

---

## Requirements

- Terraform >= 1.0
- KVM/QEMU hypervisor with libvirt
- SSH access to the hypervisor
- Base qcow2 images present in the hypervisor's libvirt storage pool (`/var/lib/libvirt/images/`)
- `edk2-ovmf` package installed on hypervisor (for UEFI if needed)

---

## Project Structure

```
.
├── main.tf          # VM and volume resource definitions
├── variables.tf     # VM configuration variables
├── provider.tf      # Terraform and libvirt provider config
└── README.md
```

---

## Configuration

All VM settings are controlled via variables in `variables.tf`. Each VM type has its own config object:

| Variable | Description |
|---|---|
| `rhel10_config` | RHEL 10 VM settings |
| `rhel9_config` | RHEL 9 VM settings |
| `alma10_config` | AlmaLinux 10 VM settings |

### Key settings per VM

| Field | Description |
|---|---|
| `name` | VM name prefix |
| `vm_count` | Number of VMs to create |
| `cpu_count` | vCPU count |
| `cpu_mode` | CPU mode (`host-passthrough` required for RHEL 10) |
| `ram_mb` | RAM in MB (minimum 4096 for RHEL 10) |
| `machine` | QEMU machine type (must match base image, e.g. `pc-q35-9.2`) |
| `base_volume_name` | Filename of base qcow2 image in the storage pool |
| `format` | Disk format (`qcow2`) |

---

## Base Image Requirements

Each base image must already exist in the hypervisor's default storage pool before running Terraform.

Verify with:
```bash
virsh vol-list default
```

### Important notes

- The `machine` type in variables **must match** the machine type the base image was installed with. Mismatches will cause kernel panics on boot.
- RHEL 10 requires `cpu_mode = "host-passthrough"`. Using the default `qemu64` CPU will cause a kernel panic (`Attempted to kill init! exit code=0x00007f00`).
- Base images installed with BIOS must use BIOS in Terraform (no `firmware`/`nvram` blocks). Do not mix BIOS images with UEFI config.

### Networking

VMs use the libvirt `default` NAT network (192.168.122.0/24). NetworkManager must have a connection profile for the network interface inside the VM. If cloned VMs have no IP on boot, run this inside the VM once:

```bash
sudo nmcli connection add type ethernet ifname enp1s0 con-name enp1s0 ipv4.method auto
sudo nmcli connection up enp1s0
```

To make this permanent for all future clones, run the above on the **base image VM** before shutting it down.

Check DHCP leases on the hypervisor at any time:
```bash
virsh net-dhcp-leases default
```

---

## Usage

### Initialize
```bash
terraform init
```

### Preview changes
```bash
terraform plan
```

### Apply
```bash
terraform apply
```

### Destroy all VMs
```bash
terraform destroy
```

---

## Provider

```hcl
provider "libvirt" {
  uri = "qemu+ssh://user@192.168.122.1/system"
}
```

Update the URI in `provider.tf` to match your hypervisor's IP and SSH user.

---

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| Kernel panic: `Attempted to kill init!` | Wrong CPU mode or machine type | Set `cpu_mode = "host-passthrough"` and match `machine` to base image |
| UEFI boot fails, no bootable device | Base image uses BIOS, not UEFI | Remove `firmware`/`nvram` blocks from domain config |
| VM has no IP address | No NM connection profile for interface | Add nmcli connection on base image |
| `no such file or directory` on apply | Terraform can't access image path directly | Use `base_volume_name` + `base_volume_pool` instead of `source` |

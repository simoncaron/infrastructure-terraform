resource "proxmox_virtual_environment_vm" "vm_jumpbox_01" {
  name      = "jumpbox-01"
  node_name = "pve02"
  on_boot   = false
  provider = proxmox.pve_cluster

  agent {
    enabled = true
  }

  cpu {
    type  = "x86-64-v2-AES"
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  disk {
    datastore_id = "local-lvm"
    file_id      = "local:iso/jammy-server-cloudimg-amd64.img"
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 32
  }

  initialization {
    datastore_id = "local-lvm"
    ip_config {
      ipv4 {
        address = "10.0.1.10/24"
        gateway = "10.0.1.1"
      }
    }

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      keys     = [var.default_ssh_public_key]
      username = "ubuntu"
    }

    vendor_data_file_id = "local:snippets/cloud-config-vendor.yaml"
  }

  network_device {
    bridge = "vnet0"
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }
}
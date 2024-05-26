resource "proxmox_virtual_environment_vm" "vm_k8s_master_03" {
  name      = "k8s-master-03"
  node_name = "pve03"
  on_boot   = false
  provider  = proxmox.pve_cluster

  agent {
    enabled = true
  }

  cpu {
    type  = "x86-64-v2-AES"
    cores = 4
  }

  memory {
    dedicated = 16384
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
        address = "10.0.2.13/24"
        gateway = "10.0.2.1"
      }
    }

    user_account {
      keys     = [var.default_ssh_public_key]
      username = "ubuntu"
    }

    vendor_data_file_id = "local:snippets/cloud-config-vendor.yaml"
  }

  network_device {
    bridge = "vnet1"
    mtu    = "1450"
  }

  operating_system {
    type = "l26"
  }
}
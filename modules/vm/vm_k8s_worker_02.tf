resource "proxmox_virtual_environment_vm" "vm_k8s_worker_02" {
  name      = "k8s-worker-02"
  node_name = "pve02"
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
    datastore_id = "local-zfs"
    file_id      = "local:iso/debian-12-generic-amd64.qcow2.img"
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 32
  }

  initialization {
    datastore_id = "local-zfs"
    ip_config {
      ipv4 {
        address = "192.168.2.214/24"
        gateway = "192.168.2.1"
      }
    }

    user_account {
      keys     = [var.default_ssh_public_key]
      username = "debian"
    }

    vendor_data_file_id = "local:snippets/cloud-config-vendor.yaml"
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }
}
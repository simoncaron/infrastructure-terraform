terraform {
  required_providers {
    proxmox = {
      source                = "bpg/proxmox"
      version               = "0.57.0"
      configuration_aliases = [proxmox.pve_cluster]
    }
  }
}
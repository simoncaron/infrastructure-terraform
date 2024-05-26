terraform {
  required_version = ">= 1.3.0"
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.57.1"
    }

    bitwarden = {
      source  = "maxlaverse/bitwarden"
      version = "0.7.2"
    }
  }
}
module "infrastructure_config" {
  source = "./modules/config"
  providers = {
    proxmox.pve_cluster = proxmox.cluster01
  }
}

module "infrastructure_lxc" {
  source = "./modules/lxc"
}

module "infrastructure_vm" {
  source                 = "./modules/vm"
  default_ssh_public_key = data.bitwarden_item_login.default_ssh_public_key.password
  depends_on             = [module.infrastructure_config]
  providers = {
    proxmox.pve_cluster = proxmox.cluster01
  }
}

module "infrastructure_dns" {
  source = "./modules/dns"
}

module "infrastructure_oci" {
  source = "./modules/oci"
}

module "infrastructure_tailscale" {
  source = "./modules/tailscale"
}

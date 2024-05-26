resource "proxmox_virtual_environment_download_file" "ubuntu-22_cloud_image" {
  count        = length(var.pve_nodes)
  content_type = "iso"
  datastore_id = "local"
  node_name    = var.pve_nodes[count.index]
  provider     = proxmox.pve_cluster

  url = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
}

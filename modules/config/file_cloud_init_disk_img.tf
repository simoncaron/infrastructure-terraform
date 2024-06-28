resource "proxmox_virtual_environment_download_file" "ubuntu-22_cloud_image" {
  count        = length(var.pve_nodes)
  content_type = "iso"
  datastore_id = "local"
  node_name    = var.pve_nodes[count.index]
  provider     = proxmox.pve_cluster

  url = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
}

resource "proxmox_virtual_environment_download_file" "debian-12_cloud_image" {
  count        = length(var.pve_nodes)
  content_type = "iso"
  datastore_id = "local"
  node_name    = var.pve_nodes[count.index]
  provider     = proxmox.pve_cluster
  file_name    = "debian-12-generic-amd64.qcow2.img"
  url = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2"
}

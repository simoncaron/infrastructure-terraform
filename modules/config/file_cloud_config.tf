resource "proxmox_virtual_environment_file" "cloud_config_vendor" {
  count        = length(var.pve_nodes)
  content_type = "snippets"
  datastore_id = "local"
  node_name    = var.pve_nodes[count.index]
  provider = proxmox.pve_cluster

  source_raw {
    data = <<EOF
#cloud-config
package_update: true
package_upgrade: true
packages: 
  - qemu-guest-agent
  - net-tools
runcmd:
  - timedatectl set-timezone America/Toronto
  - systemctl enable qemu-guest-agent
  - systemctl start qemu-guest-agent
  - ufw disable
  - echo "done" > /tmp/vendor-cloud-init-done
EOF

    file_name = "cloud-config-vendor.yaml"
  }
}

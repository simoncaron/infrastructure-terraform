data "bitwarden_item_login" "proxmox_user" {
  id = "6b4bd7da-b5e5-4717-b4f7-4230636bb37b"
}

data "bitwarden_item_login" "proxmox_password" {
  id = "d68b9210-7ef9-4066-98db-1fee4492da8b"
}

data "bitwarden_item_login" "default_ssh_public_key" {
  id = "9a7a2810-5dcd-46a2-b805-d939a0267f17"
}

terraform {
  required_version = ">=1.0.0" 
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  
  pm_api_url = "https://pve.localdomain:8006/api2/json"
  
  pm_api_token_id = "terraform@pam!new_token_id"

  pm_api_token_secret = "f9424c31-289b-4696-b34e-e9a3ce78a6cf"

  pm_tls_insecure = true
  pm_debug = true

}

resource "proxmox_vm_qemu" "replicationdb" {
  count = 2
  name = "replicationdb-${count.index + 1}"

  target_node = "pve3" 

  clone = var.template_name

  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 2000
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    size = "24G"
    type = "scsi"
    storage = "local-lvm"
    iothread = 1
  }
  
  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

 ipconfig0 = "ip=192.168.7.3${count.index + 1}/24,gw=192.168.7.1"
  
  # sshkeys
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}

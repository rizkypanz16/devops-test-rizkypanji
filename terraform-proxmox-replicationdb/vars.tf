variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCAj6cytjkoVB8a41Vkrxe5o7ZG3QJUZrA2F08UEwNqpdzhZVb0JbQuoluaTGuvhyKd4SbgMHFpJKt3puIT6oNVksBK/jwx1VUMq4PkLlJTcmi+dTLa4IUvbseFsFBMbF56tYc10Fx3NeTKYHvnsqVECZniBuo+HvhTcBDkVXxlNPbTHDryr/rz05C49O6Fh88yhA6/YSvn6Yx+6VllGZGaQOtxAs91UbkoAOzj/LMxjRcqL7l/LyEXEnd5RwW+bXzd15LWeHoFKQCax8IoHr8myow5RW2O0dYVPLKq3+KZDKflmKp90ijZjmtj2jxyftw8GdWtsyCUWjoo0dYLXV5D rsa-key-20221128"
}

variable "proxmox_host" {
    default = "pve2.localdomain"
}

variable "template_name" {
    default = "ubuntu-2004-cloudinit-template"
}

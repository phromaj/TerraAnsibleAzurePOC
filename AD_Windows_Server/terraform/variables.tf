variable "resource_group_name" {
  description = "Nom du groupe de ressources"
  default     = "ad-resource-group"
}

variable "location" {
  description = "Région Azure"
  default     = "francecentral"
}

variable "vm_name" {
  description = "Nom de la VM"
  default     = "ad-vm"
}

variable "admin_username" {
  description = "Nom d'utilisateur administrateur de la VM"
}

variable "admin_password" {
  description = "Mot de passe administrateur de la VM"
}

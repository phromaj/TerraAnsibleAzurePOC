variable "location" {
  description = "Azure region where all resources in this example should be created."
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "ad_windows"
}

variable "admin_password" {
  description = "Admin password for the Windows VM"
  type        = string
}

variable "vnet_name" {
  description = "The name of the existing virtual network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the existing subnet"
  type        = string
}
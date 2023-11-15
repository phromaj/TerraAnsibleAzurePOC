variable "location" {
  description = "Azure region where all resources in this example should be created."
  default     = "East US"
}
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
  sensitive   = true
}

variable "vnet_name" {
  description = "The name of the existing virtual network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the existing subnet"
  type        = string
}

variable "ad_users" {
  description = "List of AD users"
  default = [
    {
      name     = "user1",
      password = "Password123!"
    },
    {
      name     = "user2",
      password = "Password123!"
    },
    {
      name     = "user3",
      password = "Password123!"
    }
  ]
}

variable "vm_size" {
  description = "The size of the VM instances for AVD"
  default     = "Standard_DS1_v2"
}

variable "image_offer" {
  description = "The offer of the image used for the VMs"
  default     = "Windows-10"
}

variable "image_publisher" {
  description = "The publisher of the image used for the VMs"
  default     = "MicrosoftWindowsDesktop"
}

variable "image_sku" {
  description = "The SKU of the image used for the VMs"
  default     = "19h1-evd"
}

variable "image_version" {
  description = "The version of the image used for the VMs"
  default     = "latest"
}

variable "admin_username" {
  description = "Admin username for the Windows VM"
  default     = "adminuser"
}

variable "domain_name" {
  description = "The name of the domain to join"
  type        = string
}

variable "ou_path" {
  description = "The OU path for the domain join"
  type        = string
}

variable "domain_username" {
  description = "Username for domain join"
  type        = string
}

variable "domain_password" {
  description = "Password for domain join"
  type        = string
  sensitive   = true
}

variable "number_of_vms" {
  description = "The number of VM instances to create for AVD"
  default     = 3
}

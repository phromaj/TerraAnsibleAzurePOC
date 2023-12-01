variable "resource_group_location" {
default     = "eastus"
description = "Location of the resource group."
}

variable "rg_name" {
type        = string
default     = "ad_windows"
description = "Name of the Resource group in which to deploy service objects"
}

variable "workspace" {
type        = string
description = "Name of the Azure Virtual Desktop workspace"
default     = "AVD TF Workspace"
}

variable "hostpool" {
type        = string
description = "Name of the Azure Virtual Desktop host pool"
default     = "AVD-TF-HP"
}

variable "rfc3339" {
type        = string
default     = "2023-11-30T00:00:00Z"
description = "Registration token expiration"
}

variable "prefix" {
type        = string
default     = "avdtf"
description = "Prefix of the name of the AVD machine(s)"
}
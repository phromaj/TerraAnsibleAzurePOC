# Data source to reference existing network and subnet
data "azurerm_virtual_network" "existing_vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "existing_subnet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.existing_vnet.name
  resource_group_name  = var.resource_group_name
}

# Azure Virtual Desktop Host Pool
resource "azurerm_virtual_desktop_host_pool" "avd_host_pool" {
  name                = "avd-hostpool"
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = "Personal"
  load_balancer_type  = "Persistent"
}

# Azure Virtual Desktop Application Group
resource "azurerm_virtual_desktop_application_group" "avd_app_group" {
  name                = "avd-appgroup"
  location            = var.location
  resource_group_name = var.resource_group_name
  host_pool_id        = azurerm_virtual_desktop_host_pool.avd_host_pool.id
  type                = "Desktop"
}

# Azure Virtual Desktop Workspace
resource "azurerm_virtual_desktop_workspace" "avd_workspace" {
  name                = "avd-workspace"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Association of Application Group with Workspace
resource "azurerm_virtual_desktop_workspace_application_group_association" "avd_workspace_app_group_association" {
  workspace_id           = azurerm_virtual_desktop_workspace.avd_workspace.id
  application_group_id   = azurerm_virtual_desktop_application_group.avd_app_group.id
}
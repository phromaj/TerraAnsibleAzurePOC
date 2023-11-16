# Retrieve details of an existing virtual network by name within a specified resource group
data "azurerm_virtual_network" "existing_vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
}

# Fetch details of a specific subnet within the above-mentioned virtual network
data "azurerm_subnet" "existing_subnet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.existing_vnet.name
  resource_group_name  = var.resource_group_name
}

# Create an Azure Virtual Desktop Host Pool, which is a collection of VMs to host user sessions
resource "azurerm_virtual_desktop_host_pool" "avd_host_pool" {
  name                = "avd-hostpool"
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = "Personal" # Personal type assigns a dedicated VM to each user
  load_balancer_type  = "Persistent" # Persistent type ensures the same VM is assigned to a user each session
}

# Define an Application Group, a logical grouping of applications installed on session hosts in the host pool
resource "azurerm_virtual_desktop_application_group" "avd_app_group" {
  name                = "avd-appgroup"
  location            = var.location
  resource_group_name = var.resource_group_name
  host_pool_id        = azurerm_virtual_desktop_host_pool.avd_host_pool.id
  type                = "Desktop" # Desktop type provides full desktop experiences
}

# Create an Azure Virtual Desktop Workspace to manage and publish Application Groups
resource "azurerm_virtual_desktop_workspace" "avd_workspace" {
  name                = "avd-workspace"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Associate the Application Group with the Workspace for centralized management
resource "azurerm_virtual_desktop_workspace_application_group_association" "avd_workspace_app_group_association" {
  workspace_id           = azurerm_virtual_desktop_workspace.avd_workspace.id
  application_group_id   = azurerm_virtual_desktop_application_group.avd_app_group.id
}

# Provision a set of virtual machines for AVD session hosts
resource "azurerm_virtual_machine" "avd_vm" {
  count                 = var.number_of_vms
  name                  = "avd-vm-${count.index}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.avd_nic[count.index].id]
  vm_size               = var.vm_size
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  # Define the OS disk configuration for the VMs
  storage_os_disk {
    name              = "osdisk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
  }

  # Specify the image to be used for creating the VMs
  storage_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  # Set up the operating system profile for the VMs
  os_profile {
    computer_name  = "avd-vm-${count.index}"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  # Ensure the VM Agent is provisioned (required for Azure VM management features)
  os_profile_windows_config {
    provision_vm_agent = true
  }
}

# Create network interfaces for each VM, assigning them to the subnet and configuring IP settings
resource "azurerm_network_interface" "avd_nic" {
  count               = var.number_of_vms
  name                = "avd-nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.existing_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

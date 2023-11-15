output "avd_host_pool_id" {
  value = azurerm_virtual_desktop_host_pool.avd_host_pool.id
}

output "avd_workspace_id" {
  value = azurerm_virtual_desktop_workspace.avd_workspace.id
}

output "avd_vm_ids" {
  value = [for vm in azurerm_virtual_machine.avd_vm : vm.id]
}
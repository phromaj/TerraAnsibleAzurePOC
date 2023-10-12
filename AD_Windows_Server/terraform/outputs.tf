output "vm_public_ip" {
  description = "Public IP address of the VM"
  value       = azurerm_virtual_machine.vm.ip_address
}

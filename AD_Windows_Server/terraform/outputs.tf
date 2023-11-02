output "windows_vm_public_ip" {
  value = azurerm_public_ip.vm_pubip.ip_address
}
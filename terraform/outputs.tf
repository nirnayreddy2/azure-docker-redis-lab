output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}
output "resource_group" {
  value = azurerm_resource_group.rg.name
}
output "admin_password" {
  value = var.admin_password
  sensitive = true
}
variable "resource_group_name" {
    type = string
    description = "Name of the Azure resource group"
}
variable "location" {
    type = string
    description = "Azure region"
  default = "East US"
}
variable "vm_name" {
    type = string
    description = "Name of the virtual machine"
}
variable "admin_username" {
    type = string
    description = "Admin username for the VM"
}
variable "admin_password" {
    type = string
    description = "Admin password for the VM"
    sensitive = true
}

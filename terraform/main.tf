provider "azurerm" {
  features {}
  subscription_id = "xxxx-xxxx-xxxx-xxxx-xxxx"
}
resource "azurerm_resource_group" "rg" {
    name = var.resource_group_name
    location = var.location
}  
resource "azurerm_virtual_network" "vnet" {
    name = "myVnet"
    address_space =  ["10.0.0.0/16"]
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_subnet" "subnet" {
    name = "mySubnet"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes  = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "public_ip" {
   name = "myPublicIP"
   location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    allocation_method = "Static"
    sku = "Standard"
}

resource "azurerm_network_interface" "nic" {
    name = "myNIC"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
        name = "internal"
        subnet_id = azurerm_subnet.subnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.public_ip.id
    }
}
resource "azurerm_network_security_group" "nsg" {
  name = "myNSG"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name = "Allow-SSH-From-MyIP"
        priority = 1001
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "22"
        source_address_prefix = "0.0.0.0/0"
        destination_address_prefix = "*"
    }
}
resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  network_interface_id = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_linux_virtual_machine" "vm" {
    name = "vm-linux"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    size = "Standard_B1s"
    admin_username = "azureuser"
    network_interface_ids = [
        azurerm_network_interface.nic.id
    ]
    disable_password_authentication = true

    admin_ssh_key {
      username = "azureuser"
      public_key = file("C:/users/nirna/.ssh/id_rsa.pub")
    }
  

  os_disk {
    name = "osDisk"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }


source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
}
}
resource "azurerm_network_interface" "nic" {
  name                = "nic"
  location            = "US WEST 2"
  resource_group_name = "RG-USWST2-RPS-TFC-POC"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "SUB-USWST2-RPS-RPS1"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "poc-virtual-machine"
  resource_group_name = "RG-USWST2-RPS-TFC-POC"
  location            = "US WEST 2"
  size                = var.vm_size
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = var.image_sku
    version   = "latest"
  }

	tags = {
		RequestIT = "I0026089",
		Cost_Center = "842",
		Created_By_Email = "daniel.huerta@contractor.amat.com"
	}
}

 
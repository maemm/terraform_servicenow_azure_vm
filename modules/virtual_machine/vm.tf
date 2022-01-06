resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = "RG-USWST2-RPS-TFC-POC"
  location            = "westus2"
  size                = var.size
  admin_username      = "adminuser"
  admin_password = "pa$$w0rDd"
  network_interface_ids = [var.nic]
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = var.sku
    version   = "latest"
  }

	tags = {
		"RequestIT" = "I0000012"
		"Cost_Center" = "842"
		"Created_By_Email" = var.email
  }
}
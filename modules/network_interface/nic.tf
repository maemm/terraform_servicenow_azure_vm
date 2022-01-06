data "azurerm_subnet" "example" {
    name = "SUB-USWST2-RPS-RPS1"
    virtual_network_name = "VNET-USWST2-RPS-RPS1"
    resource_group_name = "RG-USWST2-RPS-NWRPS1"
}

resource "azurerm_network_interface" "example" {
  name = "example-nic"
  location = "westus2"
  resource_group_name = "RG-USWST2-RPS-TFC-POC"
  ip_configuration {
      name = "internal"
      subnet_id = data.azurerm_subnet.example.id
      private_ip_address_allocation = "Dynamic"
  }

  tags = {
      "RequestIT" = "I0000012"
      "Cost_Center" = "842"
      "Created_By_Email" = var.email
  }
}
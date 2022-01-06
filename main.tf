module "network_interface" {
  source = "./modules/network_interface"
  email = var.email
}

module "virtual_machine" {
  source = "./modules/virtual_machine"
  nic = module.network_interface.nic_id
  size = var.size
  sku = var.sku
  email = var.email
}
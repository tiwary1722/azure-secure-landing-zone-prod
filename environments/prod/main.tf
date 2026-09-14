module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.resource_groups
}

module "virtual_network" {
  source     = "../../modules/azurerm_virtual_network"
  vnets      = var.virtual_networks
  depends_on = [module.resource_group]
}

module "subnet" {
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
  depends_on = [module.virtual_network]
}

module "public_ip" {
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
  depends_on = [module.resource_group]
}

module "key_vault" {
  source     = "../../modules/azurerm_key_vault"
  key_vaults = var.key_vaults
  depends_on = [module.resource_group]
}

module "virtual_machine" {
  source     = "../../modules/azurerm_virtual_machine"
  vms        = var.virtual_machines
  depends_on = [module.subnet, module.key_vault, module.public_ip]
}

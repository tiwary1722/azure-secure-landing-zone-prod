resource_groups = {
  rg1 = {
    name     = "rg-slz-prod-platform-01"
    location = "centralindia"
    tags = {
      environment = "prod"
      project     = "secure-landing-zone"
      managed_by  = "terraform"
    }
  }
}

virtual_networks = {
  vnet1 = {
    name                = "vnet-slz-prod-centralindia-01"
    location            = "centralindia"
    resource_group_name = "rg-slz-prod-platform-01"
    address_space       = ["10.10.0.0/16"]
    tags = {
      environment = "prod"
    }
  }
}

subnets = {
  subnet1 = {
    name                 = "snet-slz-prod-web-01"
    resource_group_name  = "rg-slz-prod-platform-01"
    virtual_network_name = "vnet-slz-prod-centralindia-01"
    address_prefixes     = ["10.10.1.0/24"]
  }
}

public_ips = {
  pip1 = {
    name                = "pip-slz-prod-web-01"
    resource_group_name = "rg-slz-prod-platform-01"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      environment = "prod"
    }
  }
}

key_vaults = {
  kv1 = {
    name                       = "kv-slz-prod-ci-982"
    resource_group_name        = "rg-slz-prod-platform-01"
    location                   = "centralindia"
    sku_name                   = "standard"
    soft_delete_retention_days = 7
    purge_protection_enabled   = false
    tags = {
      environment = "prod"
    }
  }
}

virtual_machines = {
  web_vm = {
    name                = "vm-slz-prod-web-01"
    resource_group_name = "rg-slz-prod-platform-01"
    location            = "centralindia"
    vm_size             = "Standard_B1s"
    nic_name            = "nic-slz-prod-web-01"
    subnet_name         = "snet-slz-prod-web-01"
    vnet_name           = "vnet-slz-prod-centralindia-01"
    public_ip_name      = "pip-slz-prod-web-01"
    admin_username      = "azureadmin"
    key_vault_name      = "kv-slz-prod-ci-982"
    secret_name         = "admin-password"

    image_publisher     = "Canonical"
    image_offer         = "0001-com-ubuntu-server-jammy"
    image_sku           = "22_04-lts"
    image_version       = "latest"
  }
}
# 1. RESOURCE GROUP MAP
resource_groups = {
  "rg1" = {
    name     = "lz-enterprise-rg"
    location = "eastus"
  }
  "rg2" = {
    name     = "lz-shared-rg"
    location = "eastus"
  }
}

# 2. VIRTUAL NETWORK MAP
virtual_networks = {
  "vnet1" = {
    name                = "lz-enterprise-vnet"
    location            = "eastus"
    resource_group_name = "lz-enterprise-rg"
    address_space       = ["10.0.0.0/16"]
  }
}

# 3. SUBNETS MAP
subnets = {
  "subnet_1" = {
    name                 = "lz-frontend-subnet"
    resource_group_name  = "lz-enterprise-rg"
    virtual_network_name = "lz-enterprise-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
}

# 4. PUBLIC IP MAP
public_ip_addresses = {
  "pip1" = {
    name                = "lz-vm-publicip"
    location            = "eastus"
    resource_group_name = "lz-enterprise-rg"
    allocation_method   = "Static"
  }
}

# 5. NETWORK SECURITY GROUP (NSG) MAP
nsgs = {
  "nsg1" = {
    name                = "lz-vm-nsg"
    location            = "eastus"
    resource_group_name = "lz-enterprise-rg"
  }
}

# 6. NETWORK INTERFACE (NIC) MAP
network_interfaces = {
  "nic_1" = {
    name                = "lz-linux-vm-nic"
    location            = "eastus"
    resource_group_name = "lz-enterprise-rg"

    subnet_key = "subnet_1"
  }
}

virtual_machines = {
  "vm_1" = {
    name                = "lz-app-vm"
    location            = "eastus"
    resource_group_name = "lz-enterprise-rg"
    admin_username      = "beach-10"
    admin_password      = "public@1234"
    nic_key             = "nic_1"
  }
}

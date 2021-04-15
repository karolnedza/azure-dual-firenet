##############################################################################
#   Transit VPCs
#

resource "aviatrix_vpc" "azure_vnet_west_us" {
  cloud_type           = 8
  account_name         = "azure-account"
  name                 = "azure-transit-west-us-vpc"
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = true
  region               = "South Central US"
  cidr                 = "10.199.0.0/23"
}


resource "aviatrix_vpc" "azure_vnet_west_emea" {
  cloud_type           = 8
  account_name         = "azure-account"
  name                 = "azure-transit-west-emea-vpc"
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = true
  region               = "West Europe"
  cidr                 = "10.99.0.0/23"
}


resource "aviatrix_vpc" "azure_vnet_west_apj" {
  cloud_type           = 8
  account_name         = "azure-account"
  name                 = "azure-transit-west-apj-vpc"
  aviatrix_transit_vpc = false
  aviatrix_firenet_vpc = true
  region               = "East Asia"
  cidr                 = "10.9.0.0/23"
}


#############################################################################
##  Transit gateways
## US


resource "aviatrix_transit_gateway" "azure_transit_gateway" {
  account_name             = "azure-account"
  gw_name                  = "azure-transit-us-south-1"
  vpc_id                   = aviatrix_vpc.azure_vnet_west_us.vpc_id
  cloud_type               = 8
  vpc_reg                  = "South Central US"
  gw_size                  = "Standard_D3_v2"
  subnet                   = aviatrix_vpc.azure_vnet_west_us.public_subnets[2].cidr
  zone                     = "az-1"
  ha_subnet                = aviatrix_vpc.azure_vnet_west_us.public_subnets[3].cidr
  ha_zone                  = "az-2"
  ha_gw_size               = "Standard_D3_v2"
  enable_firenet           = false
  enable_hybrid_connection = false
  enable_active_mesh       = true
  enable_segmentation      = true
  connected_transit        = true
  enable_transit_firenet = true
}

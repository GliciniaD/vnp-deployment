resource "azurerm_resource_group" "rg" {
  for_each = var.vnet_peering
  name     = each.value.rg_name
  location = "UK South"
}

resource "azurerm_storage_account" "vnetpeering" {
  for_each                 = var.vnet_peering
  name              = var.peering_name
  resource_group_name      = azurerm_resource_group.rg[each.key].name
  location                 = azurerm_resource_group.rg[each.key].location
  virtual_network_name      = var.vnet_name
   remote_virtual_network_id =var.remote_vnet_id 
}

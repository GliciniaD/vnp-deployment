resource "azurerm_resource_group" "rg" {
  for_each = var.vnet_peering
  name     = each.value.rg_name
  location = "UK South"
}

resource "azurerm_storage_account" "vnetpeering" {
  for_each                 = var.vnet_peering
  name                     = each.value.storage_name
  resource_group_name      = azurerm_resource_group.rg[each.key].name
  location                 = azurerm_resource_group.rg[each.key].location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

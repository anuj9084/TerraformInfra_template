resource "azurerm_resource_group" "rg-dev" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location
}

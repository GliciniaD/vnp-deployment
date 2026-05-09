variable "vnet_peering" {
  type        = map(object({
    rg_name = string
    storage_name = string
}))
}

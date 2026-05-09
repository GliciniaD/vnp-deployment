variable "vnet_peering" {
  type        = map(object({
    rg_name = string
    peering_name = string
    vnet_name = string
    remote_vnet_id = string
}))
}

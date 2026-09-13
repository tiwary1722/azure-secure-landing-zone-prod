variable "resource_groups" {
  type = any
}

variable "virtual_networks" {
  type = any
}

variable "subnets" {
  type = any
}

variable "public_ips" {
  type    = any
  default = {}
}

variable "key_vaults" {
  type    = any
  default = {}
}

variable "virtual_machines" {
  type    = any
  default = {}
}
variable "infoblox_kube_master_ip" {
  default = "172.16.6.150"
}

variable "infoblox_kube_nodes_ip" {
  default = [ "172.16.6.151" , "172.16.6.152", "172.16.6.153"]
}

resource "vsphere_folder" "cicd_folder" {
  path          = "kpoleunis/cicd"
  type          = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_folder" "consul_folder" {
  path          = "kpoleunis/cicd/consul"
  type          = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

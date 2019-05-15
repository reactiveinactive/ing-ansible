resource "vsphere_folder" "kpoleunis" {
  path          = "kpoleunis"
  type          = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_folder" "kube_folder" {
  path          = "kpoleunis/kubernetes"
  type          = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}


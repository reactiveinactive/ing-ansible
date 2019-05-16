resource "vsphere_folder" "demo" {
  path          = "demo"
  type          = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_folder" "kube_folder" {
  path          = "demo/kubernetes"
  type          = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}


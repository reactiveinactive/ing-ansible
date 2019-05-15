variable "vsphere_user" {}
variable "vsphere_password" {}
variable "vsphere_server" {}
variable "vm_template_name" {
  default = "centos-eaecc09f-20190514060315"
}

provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "Lab-DC2"
}

data "vsphere_datastore" "datastore" {
  name          = "DatastoreLabDC2"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "Lab-DC2-CL1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.vm_template_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

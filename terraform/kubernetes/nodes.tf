resource "vsphere_virtual_machine" "node1" {
  name             = "kpo-kube-node2"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 4
  memory   = 8192
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  folder   = "kpoleunis/kubernetes"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
    unit_number      = "0"
  }

  disk {
    label            = "disk1"
    size             = "40"
    unit_number      = "1"
  }

  disk {
    label            = "disk2"
    size             = "20"
    unit_number      = "2"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "kpo-kube-node2"
        domain    = "lab.intranet"
      }

      network_interface {
        ipv4_address = "172.16.6.105"
        ipv4_netmask = 24
      }

      ipv4_gateway = "172.16.6.1"
      dns_suffix_list = [ "lab.intranet" ]
      dns_server_list = [ "172.16.1.14" ]
    }

  }
}

resource "vsphere_virtual_machine" "node2" {
  name             = "kpo-kube-node3"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 4
  memory   = 8192
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  folder   = "kpoleunis/kubernetes"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
    unit_number      = "0"
  }

  disk {
    label            = "disk1"
    size             = "40"
    unit_number      = "1"
  }

  disk {
    label            = "disk2"
    size             = "20"
    unit_number      = "2"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "kpo-kube-node3"
        domain    = "lab.intranet"
      }

      network_interface {
        ipv4_address = "172.16.6.106"
        ipv4_netmask = 24
      }

      ipv4_gateway = "172.16.6.1"
      dns_suffix_list = [ "lab.intranet" ]
      dns_server_list = [ "172.16.1.14" ]
    }

  }
}


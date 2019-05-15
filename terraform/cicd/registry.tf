resource "vsphere_virtual_machine" "vm" {
  name             = "docker-registry"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 2
  memory   = 4096
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

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
    size             = "5"
    unit_number      = "1"
  }

  disk {
    label            = "disk2"
    size             = "40"
    unit_number      = "2"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "docker-registry"
        domain    = "lab.internal"
      }

      network_interface {
        ipv4_address = "172.16.6.112"
        ipv4_netmask = 24
      }

      ipv4_gateway = "172.16.6.1"
      dns_suffix_list = [ "lab.internal" ]
      dns_server_list = [ "172.16.1.14" ]
    }

  }
}

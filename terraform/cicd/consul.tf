resource "vsphere_virtual_machine" "consul_bootstrap" {
  name             = "consul"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  folder           = "${vsphere_folder.consul_folder.path}"

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

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "consul"
        domain    = "lab.intranet"
      }

      network_interface {
        ipv4_address = "172.16.6.115"
        ipv4_netmask = 24
      }

      ipv4_gateway = "172.16.6.1"
      dns_suffix_list = [ "lab.intranet" ]
      dns_server_list = [ "172.16.1.14" ]
    }

  }
}

resource "vsphere_virtual_machine" "consul_server1" {
  name             = "consul-server1"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  folder           = "${vsphere_folder.consul_folder.path}"

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

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "consul-server1"
        domain    = "lab.intranet"
      }

      network_interface {
        ipv4_address = "172.16.6.116"
        ipv4_netmask = 24
      }

      ipv4_gateway = "172.16.6.1"
      dns_suffix_list = [ "lab.intranet" ]
      dns_server_list = [ "172.16.1.14" ]
    }

  }
}

resource "vsphere_virtual_machine" "consul_server2" {
  name             = "consul-server2"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  folder           = "${vsphere_folder.consul_folder.path}"

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

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "consul-server2"
        domain    = "lab.intranet"
      }

      network_interface {
        ipv4_address = "172.16.6.117"
        ipv4_netmask = 24
      }

      ipv4_gateway = "172.16.6.1"
      dns_suffix_list = [ "lab.intranet" ]
      dns_server_list = [ "172.16.1.14" ]
    }

  }
}


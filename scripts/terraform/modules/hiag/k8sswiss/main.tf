resource "random_id" "deployment_id" {
  byte_length = 2
}

locals {
  deployment_prefix = "${var.prefix}${random_id.deployment_id.hex}"
  worker_prefix     = "worker"
  master_prefix     = "master"
  cm_prefix         = "cm"

  dns_servers = ["8.8.8.8", "8.8.4.4"]
}

resource "cloud4_virtual_datacenter" "vdc01" {
  name   = "${local.deployment_prefix}-vdc"
  region = "${var.region}"
}

resource "cloud4_availability_set" "master" {
  name                    = "${local.deployment_prefix}-${local.master_prefix}-av"
  virtual_datacenter_name = "${cloud4_virtual_datacenter.vdc01.name}"
}

resource "cloud4_availability_set" "worker" {
  name                    = "${local.deployment_prefix}-${local.worker_prefix}-av"
  virtual_datacenter_name = "${cloud4_virtual_datacenter.vdc01.name}"
}

resource "cloud4_virtual_network" "vnet01" {
  name                    = "${local.deployment_prefix}-vnet"
  virtual_datacenter_name = "${cloud4_virtual_datacenter.vdc01.name}"
  address_space           = ["172.16.0.0/16"]
  dns_servers             = "${local.dns_servers}"

  subnet {
    name           = "default"
    address_prefix = "172.16.0.0/24"
  }
}

resource "cloud4_virtual_subnet" "subnet02" {
  name                 = "${local.deployment_prefix}-subnet-02"
  address_prefix       = "172.16.1.0/24"
  virtual_network_name = "${cloud4_virtual_network.vnet01.name}"
}

resource "cloud4_virtual_machine" "master" {
  count                   = "${var.master_count}"
  name                    = "${random_id.deployment_id.hex}-${local.master_prefix}-${count.index}"
  virtual_datacenter_name = "${cloud4_virtual_datacenter.vdc01.name}"
  image_name              = "${var.master_image_name}"
  profile_name            = "${var.master_size}"

  availability_set_id = "${cloud4_availability_set.master.id}"

  os_disk {
    name                      = "${local.deployment_prefix}-${local.master_prefix}-${count.index}-os-disk"
    virtual_disk_profile_name = "S60"
  }

  setup_settings_linux {
    admin_user_name     = "${var.admin_user_name}"
    admin_user_password = "${var.admin_user_password}"
    ssh_key             = "${var.ssh_key}"
  }

  network_adapter {
    name            = "${local.deployment_prefix}-${local.master_prefix}-${count.index}"
    ip_address      = "172.16.1.${count.index + 10}"
    subnet_id       = "${cloud4_virtual_subnet.subnet02.id}"
    adapter_profile = "100Mbps"
  }

  enable_in_outbound_vnet_traffic = false
  enable_internet_access          = true
  enable_remote_access            = false
}

resource "cloud4_virtual_machine" "worker" {
  count                   = "${var.worker_count}"
  name                    = "${random_id.deployment_id.hex}-${local.worker_prefix}-${count.index}"
  virtual_datacenter_name = "${cloud4_virtual_datacenter.vdc01.name}"
  image_name              = "${var.worker_image_name}"
  profile_name            = "${var.worker_size}"

  availability_set_id = "${cloud4_availability_set.worker.id}"

  os_disk {
    name                      = "${local.deployment_prefix}-${local.worker_prefix}-${count.index}-os-disk"
    virtual_disk_profile_name = "S60"
  }

  setup_settings_linux {
    admin_user_name     = "${var.admin_user_name}"
    admin_user_password = "${var.admin_user_password}"
    ssh_key             = "${var.ssh_key}"
  }

  network_adapter {
    name            = "${local.deployment_prefix}-${local.worker_prefix}-${count.index}"
    ip_address      = "172.16.1.${count.index + 20}"
    subnet_id       = "${cloud4_virtual_subnet.subnet02.id}"
    adapter_profile = "100Mbps"
  }

  enable_in_outbound_vnet_traffic = false
  enable_internet_access          = true
  enable_remote_access            = false
}

resource "cloud4_virtual_machine" "cm" {
  count                   = "${var.enable_control_machine}"
  name                    = "${random_id.deployment_id.hex}-${local.cm_prefix}-${count.index}"
  virtual_datacenter_name = "${cloud4_virtual_datacenter.vdc01.name}"
  image_name              = "Tenant-Linux-Ubuntu1604-1.0"
  profile_name            = "F4v1"

  //availability_set_id     = "${cloud4_availability_set.worker.id}"

  os_disk {
    name                      = "${local.deployment_prefix}-${local.cm_prefix}-${count.index}-os-disk"
    virtual_disk_profile_name = "S60"
  }
  setup_settings_linux {
    admin_user_name     = "${var.admin_user_name}"
    admin_user_password = "${var.admin_user_password}"
    ssh_key             = "${var.ssh_key}"
  }
  network_adapter {
    name            = "${local.deployment_prefix}-${local.cm_prefix}-${count.index}"
    ip_address      = "172.16.1.${count.index + 30}"
    subnet_id       = "${cloud4_virtual_subnet.subnet02.id}"
    adapter_profile = "100Mbps"
  }
  enable_in_outbound_vnet_traffic = false
  enable_internet_access          = true
  enable_remote_access            = true
}

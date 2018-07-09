provider "cloud4" {
  tenant_id = "${var.tenant_id}"
}

module "caas-01" {
  source                 = "../../../modules/hiag/k8sswiss"
  prefix                 = "${var.prefix}"
  ssh_key                = "${var.ssh_key}"
  admin_user_password    = "${var.admin_user_password}"
  admin_user_name        = "${var.admin_user_name}"
  enable_control_machine = "${var.enable_control_machine}"
  master_count           = "${var.master_count}"
  worker_count           = "${var.worker_count}"
}

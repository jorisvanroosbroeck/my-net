output "control_machine_address" {
  value = "${module.caas-01.remote_access_address}"
}

output "worker_names" {
  value = "${module.caas-01.worker_names}"
}

output "master_names" {
  value = "${module.caas-01.master_names}"
}

output "master_ips" {
  value = "${module.caas-01.master_ips}"
}

output "worker_ips" {
  value = "${module.caas-01.worker_ips}"
}

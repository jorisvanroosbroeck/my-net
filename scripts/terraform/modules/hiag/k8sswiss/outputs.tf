output "remote_access_address" {
  value = "${cloud4_virtual_machine.cm.*.remote_access_address}"
}

output "worker_names" {
  value = "${cloud4_virtual_machine.worker.*.name}"
}

output "master_names" {
  value = "${cloud4_virtual_machine.master.*.name}"
}

output "master_ips" {
  value = "${cloud4_virtual_machine.master.*.network_adapter.0.ip_address}"
}

output "worker_ips" {
  value = "${cloud4_virtual_machine.worker.*.network_adapter.0.ip_address}"
}

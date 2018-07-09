variable "tenant_id" {
  description = "The tenant id to be used"
}

variable "region" {
  description = "The region where the service should be deployed"
  default     = "WIN1"
}

variable "admin_user_name" {
  description = "The name of the admin user to be created on the vms"
  default     = "admin"
}

variable "admin_user_password" {
  description = "The password of the admin user to be created on the vms"
}

variable "ssh_key" {
  description = "The ssh public key to be deployed to the vms of the cluster"
}

variable "prefix" {
  description = "The environment prefix"
  default     = "itx"
}

variable "master_count" {
  description = "The count of master machines"
  default     = 2
}

variable "worker_count" {
  description = "The count of worker machines"
  default     = 3
}

variable "enable_control_machine" {
  description = "Enables the control master machine"
  default     = true
}

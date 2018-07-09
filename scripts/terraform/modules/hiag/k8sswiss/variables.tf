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
  description = "The environment prefix to be used."
}

variable "enable_control_machine" {
  description = "If true, a bastion host will be deployed."
  default     = false
}

variable "master_image_name" {
  description = "The name of the vm image to be used for master vms. Defaults to [Tenant-Linux-Ubuntu1604-1.0]"
  default     = "Tenant-Linux-Ubuntu1604-1.0"
}

variable "master_count" {
  description = "The count of the master vms. Defaults to 1"
  default     = 1
}

variable "master_size" {
  description = "The vm size for the master vms. Defaults to [F4v1]"
  default     = "F4v1"
}

variable "worker_image_name" {
  description = "The name of the vm image to be used for master vms. Defaults to [Tenant-Linux-Ubuntu1604-1.0]"
  default     = "Tenant-Linux-Ubuntu1604-1.0"
}

variable "worker_count" {
  description = "The count of the master vms. Defaults to 1"
  default     = 1
}

variable "worker_size" {
  description = "The vm size for the master vms. Defaults to [F4v1]"
  default     = "F4v1"
}

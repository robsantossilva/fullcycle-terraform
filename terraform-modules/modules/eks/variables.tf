variable "prefix" {
  default = "newcluster"
}

variable "cluster_name" {
  default = "k8s"
}

variable "retention_days" {
  default = 30
}

variable "vpc_id" {}

variable "subnet_ids" {}

########################################################################

variable "desired_size" {
  default = 2
}
variable "max_size" {
  default = 4
}
variable "min_size" {
  default = 2
}

variable "name" {}

variable "security_group_id" {}

variable "vpc_id" {}

variable "public_subnet_ids" {
  type = list(string)
}

variable "ec2_instance_ids" {
  type = list(string)
}

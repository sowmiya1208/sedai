variable "aws_region" {
  default = "us-east-1"
}

variable "name" {
  default = "sedai"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  default = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  default = "10.0.2.0/24"
}

variable "public_subnet_1_az" {
  default = "us-east-1a"
}

variable "public_subnet_2_az" {
  default = "us-east-1b"
}


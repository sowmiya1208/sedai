provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source                 = "./modules/vpc"
  name                   = var.name
  cidr_block             = var.vpc_cidr
  public_subnet_1_cidr   = var.public_subnet_1_cidr
  public_subnet_2_cidr   = var.public_subnet_2_cidr
  public_subnet_1_az     = var.public_subnet_1_az
  public_subnet_2_az     = var.public_subnet_2_az
}

module "security_groups" {
  source = "./modules/security_groups"
  name   = var.name
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source       = "./modules/ec2"
  name         = var.name
  subnet_id    = module.vpc.public_subnet_1_id
  security_group_id = module.security_groups.ec2_sg_id
}

module "alb" {
  source            = "./modules/alb"
  name              = var.name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = [module.vpc.public_subnet_1_id, module.vpc.public_subnet_2_id]
  security_group_id = module.security_groups.alb_sg_id
  ec2_instance_ids  = module.ec2.instance_ids
}



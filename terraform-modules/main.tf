terraform {
  required_version = ">=0.13.1"
  required_providers {
    aws   = ">=3.54.0"
    local = ">=2.1.0"
  }

  backend "s3" {
    bucket = "myfcbucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source         = "./modules/vpc"
  prefix         = var.prefix
  vpc_cidr_block = var.vpc_cidr_block
}

module "eks" {
  source         = "./modules/eks"
  prefix         = var.prefix
  max_size       = var.max_size
  min_size       = var.min_size
  cluster_name   = var.cluster_name
  desired_size   = var.desired_size
  vpc_id         = module.vpc.vpc_id
  retention_days = var.retention_days
  subnet_ids     = module.vpc.subnet_ids
}

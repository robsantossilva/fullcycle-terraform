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

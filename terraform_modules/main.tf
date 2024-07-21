module "vpc" {
  source         = "./modules/vpc"
  prefix         = var.prefix
  vpc_cidr_block = var.vpc_cidr_block
}

module "eks" {
  source         = "./modules/eks"
  prefix         = var.prefix
  vpc_id         = module.vpc.vpc_id
  cluster_name   = var.cluster_name
  retention_days = var.retention_days
  desired_size   = var.desired_size
  max_size       = var.max_size
  min_size       = var.min_size
  subnet_ids     = module.vpc.subnet_ids
}

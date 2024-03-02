module "vpc" {
  source = "../../modules/vpc"

  cidr_block                 = var.cidr_block
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  availability_zones         = var.availability_zones
}

module "alb" {
  source = "../../modules/alb"

  security_group = alb.security_group_id
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
}

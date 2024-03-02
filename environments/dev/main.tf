module "vpc_dev" {
  source     = "../../modules/dev"
  cidr_block = var.vpc_cidr
}

module "ec2_dev" {
  source        = "../../modules/dev"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc_dev.subnets[0] # Assuming VPC module returns a list of subnets
}

module "alb_dev" {
  source         = "../../modules/dev"
  subnets        = module.vpc_dev.public_subnets # Adjust based on the module's output
  security_group = var.dev_security_group
  vpc_id         = module.vpc_dev.vpc_id
}

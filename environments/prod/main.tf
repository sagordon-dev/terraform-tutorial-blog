module "vpc_prod" {
  source     = "../../modules/prod"
  cidr_block = var.vpc_cidr
}

module "ec2_prod" {
  source        = "../../modules/prod"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc_dev.subnets[0] # Assuming VPC module returns a list of subnets
}

resource aws_security_group "prod_security_group" {
  name_prefix = "prod-"
  vpc_id      = module.vpc_dev.vpc_id

  tags = {
    Environment = "prod"
  }
}

module "alb_prod" {
  source         = "../../modules/prod"
  subnets        = module.vpc_dev.public_subnets # Adjust based on the module's output
  security_group = aws_security_group.prod_security_group.id
  vpc_id         = module.vpc_dev.vpc_id
}
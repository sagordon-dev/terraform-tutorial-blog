module "vpc_dev" {
  source                     = "../../modules/vpc"
  cidr_block                 = var.cidr_block
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  availability_zones         = var.availability_zones
}

module "ec2_dev" {
  source         = "../../modules/ec2"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  subnets        = [module.vpc_dev.subnets[0], module.vpc_dev.subnets[1]]
  subnet_id      = module.vpc_dev.subnets[1]
  security_group = aws_security_group.dev_security_group.id
}

resource "aws_security_group" "dev_security_group" {
  name_prefix = "dev-"
  vpc_id      = module.vpc_dev.vpc_id

  tags = {
    Environment = "dev"
  }
}

module "alb_dev" {
  source         = "../../modules/alb"
  subnets        = module.vpc_dev.subnets
  security_group = aws_security_group.dev_security_group.id
  vpc_id         = module.vpc_dev.vpc_id
}

module "artifactory_server" {
  source                    = "../../modules/artifactory_server"
  artifactory_key_name      = var.artifactory_key_name
  allowed_cidr_blocks       = var.allowed_cidr_blocks
  artifactory_ami_id        = var.artifactory_ami_id
  artifactory_instance_type = var.artifactory_instance_type
  artifactory_public_key    = var.artifactory_public_key
  vpc_id                    = module.vpc_dev.vpc_id
  subnet_id                 = module.vpc_dev.subnets[0]
  volume_size               = var.volume_size
  volume_type               = var.volume_type
}


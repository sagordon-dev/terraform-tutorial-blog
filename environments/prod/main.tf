module "vpc_prod" {
  source                     = "../../modules/vpc"
  cidr_block                 = var.cidr_block
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  availability_zones         = var.availability_zones
}

module "ec2_prod" {
  source         = "../../modules/ec2"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  subnets        = [module.vpc_prod.subnets[0]] # Assuming VPC module returns a list of subnets 
  subnet_id      = module.vpc_prod.subnets[0]   # Assuming VPC module returns a list of subnets
  security_group = aws_security_group.prod_security_group.id
}

resource "aws_security_group" "prod_security_group" {
  name_prefix = "prod-"
  description = "Security group for prod instances"
  vpc_id      = module.vpc_prod.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Only allow outbound traffic to the necessary services
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = "prod"
  }
}

module "alb_prod" {
  source         = "../../modules/alb"
  subnets        = module.vpc_prod.subnets
  security_group = aws_security_group.prod_security_group.id
  vpc_id         = module.vpc_prod.vpc_id
}


resource "aws_instance" "artifactory_server" {
  ami           = var.artifactory_ami_id
  instance_type = var.artifactory_instance_type
  key_name = aws_key_pair.artifactory_key_pair.key_name
  subnet_id      = var.subnet_id

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    Name        = "artifactory_server"
    Environment = "dev"
  }
}

resource "aws_key_pair" "artifactory_key_pair" {
  public_key = file("~/.ssh/artifactory_key_pair.pem.pub")
  key_name   = "artifactory_key_pair"
}

resource "aws_security_group" "dev_security_group" {
  name_prefix = "dev-"
  description = "Security group for dev environment"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  ingress {
    from_port   = 8082
    to_port     = 8082
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = var.allowed_cidr_blocks
}

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = "dev"
  }
}



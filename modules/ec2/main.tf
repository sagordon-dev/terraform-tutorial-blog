resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = "AppServer"
  }
}

resource "aws_lb" "app_lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group]

  subnets            = [var.subnets[0], var.subnets[1]]

  enable_deletion_protection = false

  tags = {
    Name = "app-lb"
  }
}

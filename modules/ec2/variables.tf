variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch the instance in"
  type        = string
}

variable "subnets" {
  description = "The VPC Subnet IDs to launch the ALB in"
  type        = list(string)
  
}

variable "security_group" {
  description = "The security group ID to use for the ALB"
  type        = string
  
}

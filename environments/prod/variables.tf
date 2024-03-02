variable "ami_id" {
  description = "The AMI ID to use for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instances"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr_blocks" {
  description = "A list of CIDR blocks for the public subnets."
  type        = list(string)
}

variable "private_subnet_cidr_blocks" {
  description = "A list of CIDR blocks for the private subnets."
  type        = list(string)
}

variable "availability_zones" {
  description = "A list of availability zones in which to create the subnets."
  type        = list(string)
}


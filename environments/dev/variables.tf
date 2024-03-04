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

variable "allowed_cidr_blocks" {
  description = "A list of CIDR blocks to allow traffic from"
  type        = list(string)
}

variable "artifactory_ami_id" {
  description = "The AMI ID to use for the Artifactory server"
  type        = string
}

variable "artifactory_instance_type" {
  description = "The instance type to use for the Artifactory server"
  type        = string
}

variable "artifactory_key_name" {
  description = "The name of the key pair to use for the Artifactory server"
  type        = string
}

variable "artifactory_public_key" {
  description = "The public key to use for the Artifactory server"
}

variable "artifactory_allowed_cidr_blocks" {
  description = "A list of CIDR blocks to allow traffic from"
  type        = list(string)
}

variable "volume_type" {
  description = "The type of volume"
}

variable "volume_size" {
  description = "The size of the volume in GB"
  type        = number
}

variable "artifactory_key_name" {
  description = "The name of the key pair to use for the Artifactory server"
  type        = string
}

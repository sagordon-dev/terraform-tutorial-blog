variable artifactory_ami_id {
  description = "The AMI ID to use for the Artifactory server"
  type        = string
}

variable artifactory_instance_type {
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

variable "allowed_cidr_blocks" {
  description = "A list of CIDR blocks to allow traffic from"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "subnet_id" {
  description = "The ID of the subnet where the Artifactory server will be deployed"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the Artifactory server will be deployed"
  type        = string
}

variable "volume_size" {
  description = "The size of the volume in GiBs"
  default     = 300
}

variable "volume_type" {
  description = "The type of volume"
  default     = "gp3"
}
variable "subnets" {
  description = "A list of subnet IDs to attach to the LB"
  type        = list(string)
}

variable "security_group" {
  description = "The security group attached to the LB"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the resources are deployed"
  type        = string
}
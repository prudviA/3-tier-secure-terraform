variable "alb_name" {
  description = "Name of the ALB"
  type        = string
}

variable "subnets" {
  description = "List of public subnets for ALB"
  type        = list(string)
}

variable "security_groups" {
  description = "Security groups for ALB"
  type        = list(string)
}

variable "target_group_name" {
  description = "Target group name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}


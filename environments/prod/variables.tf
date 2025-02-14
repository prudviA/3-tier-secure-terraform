variable "vpc_cidr" {
  description = "CIDR block for the production VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "public_subnets" {
  description = "Public subnets for production"
  type        = list(string)
  default     = ["10.1.1.0/24", "10.1.2.0/24"]
}

variable "private_subnets" {
  description = "Private subnets for production"
  type        = list(string)
  default     = ["10.1.3.0/24", "10.1.4.0/24"]
}

variable "ami" {
  description = "AMI ID for production EC2 instances"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  description = "Instance type for production EC2"
  type        = string
  default     = "t3.medium"
}

variable "db_instance_class" {
  description = "Production RDS instance type"
  type        = string
  default     = "db.t3.medium"
}

variable "db_user" {
  description = "Database admin username"
  type        = string
  default     = "admin"
}

variable "db_pass" {
  description = "Database password"
  type        = string
  sensitive   = true
  default     = "securepassword456"
}

variable "region" {
  description = "AWS Region for production"
  type        = string
  default     = "us-east-1"
}


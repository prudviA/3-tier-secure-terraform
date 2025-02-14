variable "db_instance_class" {
  description = "RDS instance type"
  type        = string
  default     = "db.t3.micro"
}

variable "db_engine" {
  description = "Database engine"
  type        = string
  default     = "mysql"
}

variable "db_user" {
  description = "Master database username"
  type        = string
}

variable "db_pass" {
  description = "Master database password"
  type        = string
  sensitive   = true
}

variable "subnet_ids" {
  description = "List of private subnet IDs for RDS"
  type        = list(string)
}

variable "sg_id" {
  description = "Security Group ID for RDS"
  type        = string
}


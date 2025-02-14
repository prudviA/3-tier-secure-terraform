output "rds_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = aws_db_instance.db.endpoint
}

output "rds_instance_id" {
  description = "ID of the RDS instance"
  value       = aws_db_instance.db.id
}


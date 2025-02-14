resource "aws_db_instance" "db" {
  allocated_storage    = 20
  engine              = "mysql"
  instance_class      = "db.t3.micro"
  username           = var.db_user
  password           = var.db_pass
  db_subnet_group_name = aws_db_subnet_group.db_subnets.name
  vpc_security_group_ids = [var.sg_id]
  publicly_accessible  = false
}


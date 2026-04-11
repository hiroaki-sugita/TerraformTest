resource "aws_db_instance" "appdb" {
  allocated_storage      = var.allocated_storage
  engine                 = "mysql"
  engine_version         = var.engine_version
  instance_class         = var.instance_class

  db_name                = var.db_name
  username               = var.username
  password               = var.password

  skip_final_snapshot    = true
  publicly_accessible    = false

  db_subnet_group_name   = var.db_subnet_group
  vpc_security_group_ids = [var.rds_sg_id]

  tags = {
    Name = "${var.project_name}-rds"
  }
}

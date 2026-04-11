variable "project_name" {}

variable "allocated_storage" {
  description = "RDS storage size"
}

variable "engine_version" {
  description = "MySQL version"
}

variable "instance_class" {
  description = "RDS instance type"
}

variable "db_name" {
  description = "Database name"
}

variable "username" {
  description = "Master username"
}

variable "password" {
  description = "Master password"
  sensitive   = true
}

variable "db_subnet_group" {
  description = "DB subnet group name"
}

variable "rds_sg_id" {
  description = "Security group ID for RDS"
}

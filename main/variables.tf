variable "project_name" {}

variable "vpc_cidr" {}
variable "public_subnet_1a" {}
variable "public_subnet_1c" {}
variable "private_subnet_1a" {}
variable "private_subnet_1c" {}
variable "az1" {}
variable "az2" {}

variable "ami_id" {}
variable "instance_type" {}

variable "rds_allocated_storage" {}
variable "rds_engine_version" {}
variable "rds_instance_class" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {
  sensitive = true
}

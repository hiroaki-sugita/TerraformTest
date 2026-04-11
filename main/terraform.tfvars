project_name = "terraformtest"

vpc_cidr = "10.0.0.0/16"

public_subnet_1a  = "10.0.1.0/24"
public_subnet_1c  = "10.0.3.0/24"
private_subnet_1a = "10.0.2.0/24"
private_subnet_1c = "10.0.4.0/24"

az1 = "ap-northeast-1a"
az2 = "ap-northeast-1c"

ami_id        = "ami-0ba43b429395abc9a"
instance_type = "t3.micro"

rds_allocated_storage = 20
rds_engine_version    = "8.0"
rds_instance_class    = "db.t3.micro"

db_name     = "terraformtest"
db_username = "admin"
db_password = "zaq12wsx"

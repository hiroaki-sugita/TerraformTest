provider "aws" {
  region = "ap-northeast-1"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_name          = var.project_name
  vpc_cidr          = var.vpc_cidr

  public_subnet_1a  = var.public_subnet_1a
  public_subnet_1c  = var.public_subnet_1c
  private_subnet_1a = var.private_subnet_1a
  private_subnet_1c = var.private_subnet_1c

  az1 = var.az1
  az2 = var.az2
}

module "security" {
  source       = "./modules/security"
  name         = "web"
  vpc_id       = module.vpc.vpc_id
  project_name = "terraformtest"
}

module "iam" {
  source = "./modules/iam"
  name   = "web"
}

module "alb" {
  source         = "./modules/alb"
  project_name   = var.project_name
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  alb_sg_id      = module.security.alb_sg_id
}

module "asg" {
  source = "./modules/asg"

  name                 = "web"
  ami_id               = var.ami_id
  instance_type        = "t3.micro"
  iam_instance_profile = module.iam.instance_profile_name
  ec2_sg_id            = module.security.ec2_sg_id
  subnets              = module.vpc.public_subnets
  target_group_arn     = module.alb.target_group_arn

  desired_capacity = 2
  min_size         = 2
  max_size         = 4

  user_data_base64 = base64encode(file("${path.module}/modules/asg/user_data.sh"))
}

#module "ec2" {
#  source           = "./modules/ec2"
#  project_name     = var.project_name
#  ami_id           = var.ami_id
#  instance_type    = var.instance_type
#  public_subnets   = module.vpc.public_subnets
#  web_sg_id        = module.security.web_sg_id
#  target_group_arn = module.alb.target_group_arn
#}

module "rds" {
  source            = "./modules/rds"
  project_name      = var.project_name
  allocated_storage = var.rds_allocated_storage
  engine_version    = var.rds_engine_version
  instance_class    = var.rds_instance_class
  db_name           = var.db_name
  username          = var.db_username
  password          = var.db_password
  db_subnet_group   = module.vpc.db_subnet_group
  rds_sg_id         = module.security.rds_sg_id
}

module "cloudwatch" {
  source          = "./modules/cloudwatch"
  alb_arn_suffix  = module.alb.alb_arn_suffix
  asg_name        = module.asg.asg_name
  scale_out_policy_arn = module.asg.scale_out_policy_arn
  scale_in_policy_arn  = module.asg.scale_in_policy_arn
}


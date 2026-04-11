variable "project_name" {}

variable "ami_id" {
  description = "AMI ID for EC2"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "public_subnets" {
  type = list(string)
}

variable "web_sg_id" {
  description = "Security group ID for EC2"
}

variable "target_group_arn" {
  description = "Target group ARN for ALB"
}

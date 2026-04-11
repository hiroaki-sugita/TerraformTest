variable "project_name" {
  description = "Prefix for naming"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "Security group ID for ALB"
}

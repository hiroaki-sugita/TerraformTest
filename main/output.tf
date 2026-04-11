output "alb_dns" {
  value = module.alb.alb_dns_name
}

#output "ec2_ids" {
#  value = module.ec2.instance_ids
#}

output "rds_endpoint" {
  value = module.rds.endpoint
}

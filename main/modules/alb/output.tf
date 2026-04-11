output "alb_dns_name" {
  value = aws_lb.web_alb.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.web_tg.arn
}

output "alb_arn_suffix" {
  value = aws_lb.web_alb.arn_suffix
}

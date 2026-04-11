output "system_log_group" {
  value = aws_cloudwatch_log_group.system.name
}

output "httpd_access_log_group" {
  value = aws_cloudwatch_log_group.httpd_access.name
}

output "httpd_error_log_group" {
  value = aws_cloudwatch_log_group.httpd_error.name
}

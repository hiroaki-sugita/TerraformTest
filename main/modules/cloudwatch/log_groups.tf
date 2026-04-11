resource "aws_cloudwatch_log_group" "system" {
  name              = "/ec2/system"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_group" "httpd_access" {
  name              = "/ec2/httpd/access"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_group" "httpd_error" {
  name              = "/ec2/httpd/error"
  retention_in_days = 30
}

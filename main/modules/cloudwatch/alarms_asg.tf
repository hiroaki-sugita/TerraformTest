resource "aws_cloudwatch_metric_alarm" "asg_cpu_high" {
  alarm_name          = "asg-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 70

  dimensions = {
    AutoScalingGroupName = var.asg_name
  }

  alarm_description = "ASG instances CPU usage is too high"
}

resource "aws_cloudwatch_metric_alarm" "asg_status_check_failed" {
  alarm_name          = "asg-status-check-failed"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "StatusCheckFailed"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Maximum"
  threshold           = 0

  dimensions = {
    AutoScalingGroupName = var.asg_name
  }

  alarm_description = "ASG instance status check failed"
}

output "endpoint" {
  value = aws_db_instance.appdb.endpoint
}

output "db_identifier" {
  value = aws_db_instance.appdb.id
}

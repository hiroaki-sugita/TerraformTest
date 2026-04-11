output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = [aws_subnet.public_1a.id, aws_subnet.public_1c.id]
}

output "private_subnets" {
  value = [aws_subnet.private_1a.id, aws_subnet.private_1c.id]
}

output "db_subnet_group" {
  value = aws_db_subnet_group.private.name
}

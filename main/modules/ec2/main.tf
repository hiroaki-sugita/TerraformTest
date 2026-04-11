resource "aws_instance" "web" {
  count         = 2
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = element(var.public_subnets, count.index)

  vpc_security_group_ids = [var.web_sg_id]

  tags = {
    Name = "${var.project_name}-ec${count.index}"
  }
}

resource "aws_lb_target_group_attachment" "web_attach" {
  count            = 2
  target_group_arn = var.target_group_arn
  target_id        = aws_instance.web[count.index].id
  port             = 80
}

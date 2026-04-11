resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = { Name = var.vpc_name }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = { Name = "${var.vpc_name}-igw" }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = { Name = "${var.vpc_name}-public-rt" }
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_1a
  availability_zone       = var.az1
  map_public_ip_on_launch = true
  tags = { Name = "${var.vpc_name}-public-1a" }
}

resource "aws_subnet" "public_1c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_1c
  availability_zone       = var.az2
  map_public_ip_on_launch = true
  tags = { Name = "${var.vpc_name}-public-1c" }
}

resource "aws_subnet" "private_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_1a
  availability_zone = var.az1
  tags = { Name = "${var.vpc_name}-private-1a" }
}

resource "aws_subnet" "private_1c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_1c
  availability_zone = var.az2
  tags = { Name = "${var.vpc_name}-private-1c" }
}

resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_1c" {
  subnet_id      = aws_subnet.public_1c.id
  route_table_id = aws_route_table.public.id
}

resource "aws_db_subnet_group" "private" {
  name       = "${var.vpc_name}-db-subnet"
  subnet_ids = [aws_subnet.private_1a.id, aws_subnet.private_1c.id]
}

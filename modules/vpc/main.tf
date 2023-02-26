resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name" = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.availability_zone_1
  tags = {
    "Name" = var.public_subnet_name
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = var.rt_name
  }
}

resource "aws_route_table_association" "rta-1" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = var.igw_name
  }
}

resource "aws_route" "internet_route" {
  destination_cidr_block = var.all_cidr
  route_table_id         = aws_route_table.rt.id
  gateway_id             = aws_internet_gateway.igw.id
}
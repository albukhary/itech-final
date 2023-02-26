output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_cird" {
  value = aws_vpc.vpc.cidr_block
}

output "subnet_id" {
  value = aws_subnet.public.id
}
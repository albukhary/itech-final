resource "aws_security_group" "http-sg" {
  name        = "allow_http_access"
  description = "allow inbound http traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "Open port 80, http"
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    to_port     = "0"
  }
  tags = {
    "Name" = "iTech-Final-HTTP-SG"
  }
}
data "aws_ami" "amazon_ami" {
  filter {
    name   = "name"
    values = [var.ami]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  most_recent = true
  owners      = ["amazon"]
}
resource "aws_instance" "app-server1" {
  instance_type               = "t2.micro"
  ami                         = data.aws_ami.amazon_ami.id
  vpc_security_group_ids      = [aws_security_group.http-sg.id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  tags = {
    Name = "app-server-1"
  }
  user_data = file("${path.module}/user_data/user_data.tpl")
}
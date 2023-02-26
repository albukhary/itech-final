variable "vpc_id" {
}

variable "subnet_id" {
}

variable "ami" {
  default = "amzn2-ami-hvm-2.0.20220606.1-x86_64-gp2"
}

variable "instance_type" {
  default = "t2.micro"
}
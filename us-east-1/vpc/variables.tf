variable "aws_region" {
  default = "us-east-1"
}
variable "vpc_cidr" {
  default = "10.20.20.0/25"
}

variable "vpc_name" {
  default = "iTech-Final-VPC"
}

variable "subnet_cidr" {
  default = "10.20.20.0/26"
}

variable "subnet_name" {
  default = "iTech-Final-Public"
}

variable "availability_zone" {
  default = "us-east-1"
}

variable "all_cidr" {
  default = "0.0.0.0/0"
}

variable "rt_name" {
  default = "iTech-Final-Route-table"
}

variable "igw_name" {
  default = "iTech-Final-Internet-Gateway"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "dynamodb_table" {
  default = "itech-final-tfstate-lock"
}

variable "state_bucket" {
  default = "itech-final-state"
}
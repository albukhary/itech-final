terraform {
  backend "s3" {
    bucket = "itech-final-state"
    key = "us-east-1/compute/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "itech-final-tfstate-lock"
    encrypt = true
  }
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "4.53.0"
    }
  }
  required_version = ">= 1.0.2"
}

provider "aws" {
    region = var.aws_region
    default_tags {
      tags = {
        "Environment" = "Development"
        "Team" = "iTech-DevOps"
        "DevelopedBy" = "Terraform"
        "Application" = "Terraform Backend"
        "OwnerEmail" = "lazizbekexclusive@gmail.com"
      }
    }    
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "itech-final-state"
    key = "us-east-1/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

module "compute" {
  source = "../../modules/compute"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_id = data.terraform_remote_state.vpc.outputs.subnet_id
  instance_type = "t2.micro"
}
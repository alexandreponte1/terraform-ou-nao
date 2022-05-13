terraform {

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }

  }
  #  backend "s3" {
  #    bucket         = "tfstatebackendinfradev"
  #    key            = "terraform.tfstate"
  #    region         = "us-east-1"
  #    dynamodb_table = "tfstatebackendinfradev"
  #  }
}

provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}



resource "aws_instance" "app_server" {
  ami           = "ami-09d56f8956ab235b3"
  instance_type = "t2.micro"

  tags = {
    Name = "Primeira_ou_nao"
  }
}
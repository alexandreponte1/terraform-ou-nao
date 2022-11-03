terraform {
    backend "remote" {
    organization = "asponte"
    workspaces {
      name = "Example-Workspace"
    }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
 # profile = var.aws_profile
  region  = var.aws_region
}




resource "aws_instance" "app_server" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstanceGOKUUUU"
  }
}
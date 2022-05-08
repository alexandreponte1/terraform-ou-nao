terraform {

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }

  }
  # backend "s3" {
  #   bucket         = "tfstatebackendinfradev"
  #   key            = "terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "tfstatebackendinfradev"
  # }
}

provider "aws" {
  region = var.aws_region
}

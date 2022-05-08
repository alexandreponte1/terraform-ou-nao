terraform {

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

# resource "aws_cognito_user_pool" "id" {
#   user_pool_id = "us-east-1_DXVFbctRo"
# }
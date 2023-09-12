terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.0"
    }
  }

  # backend "s3" {
  # bucket = "bucket-name"
  # key    = "aws-vpc/dev/lambda-awsips/terraform.tfstate"
  # region = "us-east-2"
  # }

}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

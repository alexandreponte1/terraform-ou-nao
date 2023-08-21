# terraform {

#   # required_providers {
#   #   aws = {
#   #     source = "hashicorp/aws"
#   #   }
#   #   random = {
#   #     source = "hashicorp/random"
#   #   }
#   # }
# }


provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name                 = "VPC-SUBTESTE"
  cidr                 = "10.0.0.0/16" #10.0.1.1 - 10.0.255.255
  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = false
}





resource "aws_subnet" "private_subnet" {
  for_each   = var.private_subnet
  vpc_id     = module.vpc.vpc_id
  cidr_block = each.value.cidr
  availability_zone = each.value.az

  tags = {
    "Name" = "${var.service_name}-${var.environment}-private-${each.value.az}"
    "env"  = var.environment
    "name" = "vpc-${var.environment}"
  }
}
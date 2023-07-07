module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name                 = "VPC-ECS"
  cidr                 = "10.0.0.0/16" #10.0.1.1 - 10.0.255.255
  enable_dns_hostnames = true
  enable_dns_support   = true


  azs            = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = false
}
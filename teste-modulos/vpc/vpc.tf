module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "GF"
  cidr = "192.168.0.0/16"

  azs             = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  private_subnets = ["192.168.1.0/25", "192.168.2.0/25"]
  public_subnets  = ["192.168.3.0/25", "192.168.4.0/25"]

  enable_nat_gateway     = false
  single_nat_gateway     = false
  enable_vpn_gateway     = false
  one_nat_gateway_per_az = false

  tags = {
    Terraform   = "true"
    Environment = "${var.env}"
  }
}


# output "this_vpc" {
#   value = module.vpc.vpc_id
# }
# what are Dynamic Blocks

# Dynamically constructs repeatable nested configuration blocks inside Terraform resources

# Supported within the following blocks types
# - resource
# - data
# - provider
# - provisioner


# Used to make your code look cleaner


# resource "aws_security_group" "my-sg"{
#   name    = "my-aws-security-group"
#   vpc_id  = aws_vpc.my-vpc.id
#   ingress{
#     from_port = 22
#     to_port   = 22
#     protocol  = "TCP"
#     cidr_blocks - ["1.2.3.4/32"]
#   }
#   ingress{
#     ...#more ingress rules
#   }
# }


resource "aws_security_group" "my-sg"{
  name    = "my-aws-security-group"
  vpc_id  = aws_vpc.my-vpc.id
  dynamic "ingress"{      # the config block you're tring to replicate
    for_each = var.rules  # complex variables to iterate over
    content{
      from_port   = ingres.value["port"]    # The nested "content" block defines the
      to_port     = ingres.value["port"]    # body of each genereated block,
      protocol    = ingres.value["proto"]   # using the variable you
      cidr_blocks = ingres.value["cidrs"]   # provided
    }
  }
}








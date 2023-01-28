# provider "aws" {
#   region  = var.aws_region
#   profile = var.aws_profile
# }
# resource "aws_instance" "vmDBZ" {
#   ami           = "ami-wewewewe"
#   subnet_id     = "subnet-0b0fc67df99140b34" #se não existe uma vpc default criada é necessário passar uma subnet_id
#   instance_type = "t3.micro"
#   tags = {
#     Name = "DBZmy-first-tf-nodeDBZ"
#   }
# }

data "aws_ami" "ubuntu" {

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/*-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

output "test" {
  value = data.aws_ami.ubuntu
}





module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = terraform.workspace == "default" ? var.prodNAME : var.devNAME

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_security_group.selected.id]
  user_data              = file("script.sh")

  tags = {
    Terraform   = "true"
    Environment = "${terraform.workspace == "default" ? var.prodNAME : var.devNAME}"
  }
}














# resource "aws_instance" "nginx1" {
#   ami                    = data.aws_ami.ubuntu.id
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = [data.aws_security_group.selected.id]
#   user_data              = <<EOF
# #!/bin/bash
# sudo apt-get update
# sudo apt install -y nginx
# sudo su
# sudo echo "<h1>Hello World from the other side, i am at $(hostname -f)</h1>" > /var/www/html/index.nginx-debian.html
# sudo systemctl restart nginx
# sudo systemctl status nginx
# sudo nginx -t
# EOF

#   tags = {
#     Terraform   = "true"
#     Environment = "${terraform.workspace == "default" ? var.prodNAME : var.devNAME}"
#     Name        = "${terraform.workspace == "default" ? var.prodNAME : var.devNAME}"
#   }
# }







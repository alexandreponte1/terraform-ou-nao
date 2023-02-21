data "aws_ami" "ubuntu" {

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/*-amd64-server-*"]
  }

  # ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230208
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

output "test" {
  value = data.aws_ami.ubuntu
}


# data "aws_ami" "amzlinux" {
#   most_recent      = true
#   owners           = ["amazon"]
#   filter {
#     name   = "name"
#     values = ["amzn2-ami-*-hvm-*-x86_64-gp2"]
#   }

#   # amzn2-ami-kernel-5.10-hvm-2.0.20230207.0-x86_64-gp2

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }


resource "aws_instance" "web1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  user_data     = file("script.sh")
  tags = {
    Name = "goku1"
  }

  vpc_security_group_ids = [aws_security_group.webapp.id]
}
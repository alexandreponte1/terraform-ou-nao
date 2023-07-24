resource "aws_security_group" "eu" {
  name        = "default"
  description = "default VPC security group"
  vpc_id      = "vpc-0c0a88d96180d3ff5"

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = var.cdirs_acesso_remoto

  }


  ingress {
    from_port   = 9092
    to_port     = 9092
    protocol    = "tcp"
    cidr_blocks = var.cdirs_acesso_remoto

  }


    ingress {
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      self = true

    }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}



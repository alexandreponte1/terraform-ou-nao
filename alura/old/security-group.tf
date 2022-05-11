resource "aws_security_group" "acesso_ssh" {
  name        = "acesso_ssh"
  description = "Allow acesso_ssh"

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cdirs_acesso_remoto
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cdirs_acesso_remoto
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "acesso-ssh-us-east-2" {
  provider    = aws.us-east-2
  name        = "acesso_ssh"
  description = "Allow acesso_ssh"

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cdirs_acesso_remoto
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cdirs_acesso_remoto
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "SonarQube" {
  name        = "SonarSonarQubeQube-SG"
  description = "Allow incoming connections"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cdirs_acesso_remoto

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cdirs_acesso_remoto
  }

  tags = {
    Name = "SonarQube"
  }
}
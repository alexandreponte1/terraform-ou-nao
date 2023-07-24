resource "aws_security_group" "fringe-container" {
  name        = "fringe-SG"
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
    Name = "fringe-container"
  }
}



# resource "aws_security_group" "EFS" {
#   name        = "EFS-SG"
#   description = "Allow EFS-SG"
#   vpc_id      = module.vpc.vpc_id

#   ingress {
#     from_port       = 2049
#     to_port         = 2049
#     protocol        = "tcp"
#     security_groups = [aws_security_group.fringe-container.id]

#   }
#   tags = {
#     Name = "EFS-SG"
#   }
# }
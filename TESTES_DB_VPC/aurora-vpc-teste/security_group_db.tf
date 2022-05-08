resource "aws_security_group" "aurora" {
  name        = "DB"
  description = "Allow incoming database connections"
  vpc_id      = aws_vpc.dev-goku.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.web.id]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.pvt_a.cidr_block, aws_subnet.pvt_b.cidr_block, aws_subnet.pvt_c.cidr_block]
  }

  # ingress {
  #   from_port   = 3306
  #   to_port     = 3306
  #   protocol    = "tcp"
  #   cidr_blocks = [aws_subnet.pvt_b.cidr_block]
  # }

  # ingress {
  #   from_port   = 3306
  #   to_port     = 3306
  #   protocol    = "tcp"
  #   cidr_blocks = [aws_subnet.pvt_c.cidr_block]
  # }


# #incluso para teste
#   ingress {
#     from_port   = 3306
#     to_port     = 3306
#     protocol    = "tcp"
#     cidr_blocks = [aws_subnet.pub_a.cidr_block]
#   }


#   ingress {
#     from_port   = 3306
#     to_port     = 3306
#     protocol    = "tcp"
#     cidr_blocks = [aws_subnet.pub_b.cidr_block]
#   }


  tags = merge(local.common_tags, { Name = "Database MySQL" })
}

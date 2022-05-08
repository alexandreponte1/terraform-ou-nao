resource "aws_security_group" "web" {
  name        = "Web"
  description = "Allow public inbound traffic"
  vpc_id      = aws_vpc.dev-goku.id


  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.pvt_a.cidr_block]
  }


  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.pvt_b.cidr_block]
  }


  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.pvt_c.cidr_block]
  }

  tags = merge(local.common_tags, { Name = "Web Server" })
}
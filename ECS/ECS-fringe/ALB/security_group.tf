resource "aws_security_group" "alb" {
  name   = "alb_ECS"
  vpc_id = module.vpc.vpc_id
}

resource "aws_security_group_rule" "tcp_alb" {
  type              = "ingress"
  from_port         = 9000
  to_port           = 9000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] #0.0.0.0 - 255.255.255.255
  security_group_id = aws_security_group.alb.id
}

resource "aws_security_group_rule" "saida_alb" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"] #0.0.0.0 - 255.255.255.255
  security_group_id = aws_security_group.alb.id
}

resource "aws_security_group" "privado" {
  name   = "privado_ECS"
  vpc_id = module.vpc.vpc_id
}

resource "aws_security_group_rule" "entrada_ECS" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = aws_security_group.alb.id
  security_group_id        = aws_security_group.privado.id
}

resource "aws_security_group_rule" "saida_ECS" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"] #0.0.0.0 - 255.255.255.255
  security_group_id = aws_security_group.privado.id
}


resource "aws_security_group_rule" "entrada_EFS" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = aws_security_group.EFS.id
  security_group_id        = aws_security_group.privado.id
}


resource "aws_security_group_rule" "saida_EFS" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  # cidr_blocks       = ["0.0.0.0/0"] #0.0.0.0 - 255.255.255.255
  source_security_group_id = aws_security_group.privado.id
  security_group_id = aws_security_group.EFS.id
}





resource "aws_security_group" "EFS" {
  name        = "EFS-SG"
  description = "Allow incoming connections"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "teste123"
  }
}
module "ecs" {
  source             = "terraform-aws-modules/ecs/aws"
  version            = "3.5.0"
  name               = var.ambiente
  container_insights = true
  capacity_providers = ["FARGATE"]
  default_capacity_provider_strategy = [
    {
      capacity_provider = "FARGATE"
    }
  ]
}

resource "aws_ecs_task_definition" "Django-API" {
  family                   = "Django-API"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.cargo.arn
  container_definitions = jsonencode(
    [
      {
        "name"      = "producao"
        "image"     = "595438810944.dkr.ecr.us-east-1.amazonaws.com/producao:v1"
        "cpu"       = 256
        "memory"    = 512
        "essential" = true
        "portMappings" = [
          {
            "containerPort" = 8000
            "hostPort"      = 8000
          }
        ]
      }
    ]
  )
}


resource "aws_ecs_service" "Django-API" {
  name            = "Django-API"
  cluster         = module.ecs.ecs_cluster_id
  task_definition = aws_ecs_task_definition.Django-API.arn
  desired_count   = 3

  load_balancer {
    target_group_arn = aws_lb_target_group.alvo.arn
    container_name   = "producao"
    container_port   = 8000
  }

  network_configuration {
      subnets = module.vpc.private_subnets
      security_groups = [aws_security_group.privado.id]
  }

  capacity_provider_strategy {
      capacity_provider = "FARGATE"
      weight = 1 #100/100
  }
}
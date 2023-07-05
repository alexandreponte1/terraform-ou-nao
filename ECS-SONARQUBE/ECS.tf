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

resource "aws_ecs_task_definition" "SonarQube" {
  family                   = "SonarQube"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 4096
  execution_role_arn       = aws_iam_role.cargo.arn
  container_definitions    = <<DEFINITION
[
  {
      "memory": 1024,
      "cpu": 4096,
      "portMappings": [
          {
              "name": "sonarqube-9000-tcp",
              "containerPort": 9000,
              "hostPort": 9000,
              "protocol": "tcp",
              "appProtocol": "http"
          },
          {
              "name": "sonarqube-9092-tcp",
              "containerPort": 9092,
              "hostPort": 9092,
              "protocol": "tcp",
              "appProtocol": "http"
          }
       ],
      "essential": true,
      "mountPoints": [
          {
              "sourceVolume": "data",
              "containerPath": "/opt/sonarqube/data",
              "readOnly": false
          }
      ],
      "name": "producao",
      "image": "sonarqube"
  }
]
DEFINITION

  volume {
    name = "data"
    efs_volume_configuration {
      file_system_id = aws_efs_file_system.foo.id
      root_directory = "/"
    }
  }
}


resource "aws_ecs_service" "SonarQube" {
  name            = "SonarQube"
  cluster         = module.ecs.ecs_cluster_id
  task_definition = aws_ecs_task_definition.SonarQube.arn
  desired_count   = 1

  load_balancer {
    target_group_arn = aws_lb_target_group.alvo.arn
    container_name   = "producao"
    container_port   = 9000
  }

  network_configuration {
    subnets         = module.vpc.private_subnets
    security_groups = [aws_security_group.privado.id]
  }

  capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1 #100/100
  }
}












# -----

# Esse funciona
# module "ecs" {
#   source             = "terraform-aws-modules/ecs/aws"
#   version            = "3.5.0"
#   name               = var.ambiente
#   container_insights = true
#   capacity_providers = ["FARGATE"]
#   default_capacity_provider_strategy = [
#     {
#       capacity_provider = "FARGATE"
#     }
#   ]
# }

# resource "aws_ecs_task_definition" "SonarQube" {
#   family                   = "SonarQube"
#   requires_compatibilities = ["FARGATE"]
#   network_mode             = "awsvpc"
#   cpu                      = 1024
#   memory                   = 4096
#   execution_role_arn       = aws_iam_role.cargo.arn
#   container_definitions = jsonencode(
#     [
#       {
#         "name"      = "producao"
#         "image"     = "sonarqube"
#         "cpu"       = 1024
#         "memory"    = 4096
#         "essential" = true
#         "portMappings" = [
#           {
#             "containerPort" = 9000
#             "hostPort"      = 9000
#           }
#         ]
#       }
#     ]
#   )
# }


# resource "aws_ecs_service" "SonarQube" {
#   name            = "SonarQube"
#   cluster         = module.ecs.ecs_cluster_id
#   task_definition = aws_ecs_task_definition.SonarQube.arn
#   desired_count   = 1

#   load_balancer {
#     target_group_arn = aws_lb_target_group.alvo.arn
#     container_name   = "producao"
#     container_port   = 9000
#   }

#   network_configuration {
#     subnets         = module.vpc.private_subnets
#     security_groups = [aws_security_group.privado.id]
#   }

#   capacity_provider_strategy {
#     capacity_provider = "FARGATE"
#     weight            = 1 #100/100
#   }
# }






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


resource "aws_ecs_task_definition" "fringe" {
  family                   = "fringe-example"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ECS.arn
  container_definitions = jsonencode(
    [
      {
        "name"      = "fringe"
        "image"     = "alexandreponte/fringe"
        "cpu"       = 256
        "memory"    = 512
        "essential" = true
        "portMappings" = [
          {
            "containerPort" = 80
            "hostPort"      = 80
          }
        ],
        #   "mountPoints" = [
        #   {
        #      "sourceVolume" = "data",
        #      "containerPath" = "/opt/fringe-container/data",
        #      "readOnly" = false
        #  }
        #   ],
        "logConfiguration" = {
          "logDriver" = "awslogs",
          "options" = {
            "awslogs-group"         = "fringe",
            "awslogs-create-group"  = "true"
            "awslogs-region"        = "us-east-1",
            "awslogs-stream-prefix" = "ecs"
          }
        }
      }
    ]
  )
  # volume {
  #   name = "data"
  #   efs_volume_configuration {
  #   file_system_id = "fs-0beb9ded1eb974aa6"
  #   root_directory = "/"
  #    }
  # }
}

resource "aws_ecs_service" "fringe" {
  name             = "fringe-example"
  cluster          = module.ecs.ecs_cluster_id
  task_definition  = aws_ecs_task_definition.fringe.arn
  desired_count    = 1
  launch_type      = "FARGATE"
  platform_version = "1.4.0" //not specfying this version explictly will not currently work for mounting EFS to Fargate

  network_configuration {
    security_groups  = [aws_security_group.fringe-container.id]
    subnets          = module.vpc.public_subnets
    assign_public_ip = true
  }
}
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




resource "aws_ecs_task_definition" "sonar" {
  family                   = "sonar-example"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"
  memory                   = "4096"
  network_mode             = "awsvpc"
  container_definitions = jsonencode(
    [
      {
        "name"      = "producao"
        "image"     = "sonarqube"
        "cpu"       = 1024
        "memory"    = 4096
        "essential" = true
        "portMappings" = [
          {
            "containerPort" = 9000
            "hostPort"      = 9000
          }
        ],
      #   "mountPoints" = [
      #   {
      #      "sourceVolume" = "data",
      #      "containerPath" = "/opt/sonarqube/data",
      #      "readOnly" = false
      #  }
      #   ]
      }
    ]
  )
  # volume {
  #   name = "data"
  #   efs_volume_configuration {
  #   file_system_id = aws_efs_file_system.foo.id
  #   root_directory = "/"
  #    }
  # }
}




resource "aws_ecs_service" "SonarSonarQubeQube" {
  name            = "sonar-example"
  cluster         = module.ecs.ecs_cluster_id
  task_definition = aws_ecs_task_definition.sonar.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  platform_version = "1.4.0" //not specfying this version explictly will not currently work for mounting EFS to Fargate

  network_configuration {
    security_groups  = [aws_security_group.SonarQube.id]
    subnets          = module.vpc.public_subnets
    assign_public_ip = true
  }
}
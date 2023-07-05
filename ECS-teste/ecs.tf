resource "aws_ecs_cluster" "nginx2" {
  name = "sonar-example"
}

resource "aws_ecs_service" "nginx" {
  name            = "sonar-example"
  cluster         = aws_ecs_cluster.nginx2.id
  task_definition = aws_ecs_task_definition.sonar.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  # platform_version = "1.4.0" //not specfying this version explictly will not currently work for mounting EFS to Fargate

  network_configuration {
    security_groups  = [aws_security_group.nginx2.id]
    subnets          = module.vpc.public_subnets
    assign_public_ip = true
  }
}


resource "aws_ecs_task_definition" "sonar" {
  family                   = "sonar-example"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"
  memory                   = "4096"
  network_mode             = "awsvpc"

  container_definitions = <<DEFINITION
[
  {
      "memory": 4096,
      "cpu": 1024,
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
      "name": "sonarqube",
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

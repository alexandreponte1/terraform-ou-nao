resource "aws_iam_role" "ECS" {
  name = "${var.cargoIAM}_task"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = ["ec2.amazonaws.com",
          "ecs-tasks.amazonaws.com"]
        }
      },
    ]
  })
}

resource "aws_iam_role_policy" "ecs_ecr" {
  name = "ecs_ecr"
  role = aws_iam_role.ECS.id

  policy = file("policy.json")

}

resource "aws_iam_instance_profile" "perfil" {
  name = "${var.cargoIAM}_perfil"
  role = aws_iam_role.ECS.name
}
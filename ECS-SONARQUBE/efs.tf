resource "aws_efs_file_system" "foo" {
  tags = {
    Name = "ECS-EFS-FS"
  }
}

resource "aws_efs_mount_target" "mount" {
  file_system_id = aws_efs_file_system.foo.id
  subnet_id      = element(module.vpc.private_subnets, 0)
  # security_groups = [aws_security_group_rule.entrada_ECS.id, aws_security_group_rule.saida_ECS.id, aws_security_group.alb.id]

  # tags = {
  #   Name = "ECS-EFS-MNT"
  # }
}
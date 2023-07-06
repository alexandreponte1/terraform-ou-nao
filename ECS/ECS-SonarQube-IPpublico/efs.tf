# resource "aws_efs_file_system" "foo" {
#   tags = {
#     Name = "ECS-EFS-FS"
#   }
# }

# resource "aws_efs_mount_target" "mount" {
#   file_system_id = aws_efs_file_system.foo.id
#   subnet_id      = element(module.vpc.public_subnets, 0)

#   # tags = {
#   #   Name = "ECS-EFS-MNT"
#   # }
# }


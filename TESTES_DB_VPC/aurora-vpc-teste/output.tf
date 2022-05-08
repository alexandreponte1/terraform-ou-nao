######output DB

output "aurora_cluster_arn" {
  value = aws_rds_cluster.default.arn
}

output "aurora_instances_arn" {
  value = aws_rds_cluster_instance.cluster_instances.arn
}

######output VPC ID

output "vpc_id" {
  value = aws_vpc.dev-goku.id
}


######output security group

output "security_group_web" {
  value = aws_security_group.web.id
}

output "security_group_DB" {
  value = aws_security_group.aurora.id
}
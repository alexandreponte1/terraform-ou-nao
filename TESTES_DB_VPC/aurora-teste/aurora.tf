resource "aws_db_subnet_group" "aurora" {
  name       = "aurora_dev"
  subnet_ids = [aws_subnet.pvt_a.id, aws_subnet.pvt_b.id, aws_subnet.pvt_c.id]

  tags = merge(local.common_tags, { Name = "DB subnet group" })
}


resource "aws_db_subnet_group" "public" {
  name       = "aurora_dev_public"
  subnet_ids = [aws_subnet.pub_a.id, aws_subnet.pub_b.id]

  tags = merge(local.common_tags, { Name = "DB subnet group pub" })
}




resource "aws_rds_cluster" "aurora" {
  cluster_identifier      = "aurora-cluster-goku"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.03.2"
  availability_zones      = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  database_name           = "goku"
  master_username         = "goten"
  master_password         = var.dbpassword
  backup_retention_period = 1
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true

  db_subnet_group_name   = aws_db_subnet_group.aurora.id
  vpc_security_group_ids = [aws_security_group.aurora.id]

  tags = merge(local.common_tags, { Name = "DB Aurora Cluster" })

}
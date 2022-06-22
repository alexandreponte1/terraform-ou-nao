resource "aws_db_subnet_group" "aurora" {
  name       = "aurora_dev"
  subnet_ids = [aws_subnet.pvt_a.id, aws_subnet.pvt_b.id, aws_subnet.pvt_c.id]

  tags = merge(local.common_tags, { Name = "DB subnet group" })
}


resource "aws_rds_cluster_instance" "cluster_instances" {
  # count              = 1
  # identifier         = "aurora-cluster-demo-${count.index}"
  identifier         = "aurora-cluster-demo-goku"
  cluster_identifier = aws_rds_cluster.default.id
  instance_class     = "db.t3.small"
  #instance_class     = "db.t2.micro"
  engine         = aws_rds_cluster.default.engine
  engine_version = aws_rds_cluster.default.engine_version
}

resource "aws_rds_cluster" "default" {
  cluster_identifier      = "aurora-cluster-goku"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.10.2"
  availability_zones      = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  database_name           = "goku"
  master_username         = "gohan"
  master_password         = var.dbpassword
  allocated_storage       = 30
  backup_retention_period = 7
  preferred_backup_window = "00:03-09:00"
  skip_final_snapshot     = true

  db_subnet_group_name   = aws_db_subnet_group.aurora.id
  vpc_security_group_ids = [aws_security_group.aurora.id]

  tags = merge(local.common_tags, { Name = "DB Aurora Cluster" })

}



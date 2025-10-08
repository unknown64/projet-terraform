# Groupe de subnets pour RDS (2 subnets privés)
resource "aws_db_subnet_group" "rds_subnets" {
  name       = "rds-subnet-group"
  subnet_ids = [
    aws_subnet.private1.id,
    aws_subnet.private2.id
  ]
  description = "Subnet group for RDS"
}

# Instance RDS MySQL
resource "aws_db_instance" "students_db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name              = "STUDENTS"
  username             = "nodeapp"
  password             = "student12"
  db_subnet_group_name = aws_db_subnet_group.rds_subnets.name
  publicly_accessible  = false
  skip_final_snapshot  = true

  tags = { Name = "rds-students-db" }
}

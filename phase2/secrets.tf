resource "aws_secretsmanager_secret" "db_secret" {
  name        = "Mydbsecret"
  description = "Database secret for web app"
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    user     = "nodeapp"
    password = "student12"
    host     = aws_db_instance.students_db.endpoint
    db       = "STUDENTS"
  })
}

data "aws_vpc" "selected" {
  default = true
}

data "aws_secretsmanager_secret" "db-secret" {
  arn = module.db.db_instance_master_user_secret_arn
}

data "aws_secretsmanager_secret_version" "current" {
  secret_id = data.aws_secretsmanager_secret.db-secret.id
}

module "secrets_manager" {
  source = "terraform-aws-modules/secrets-manager/aws"

  # Secret
  name        = "simple-bank-env"
  description = "app properties for simple-bank project"

  # Policy
  block_public_policy = true

  secret_string = jsonencode({
    DB_SOURCE             = format("\"postgresql://%s:%s@%s/simple_bank?sslmode=disable\"", module.db.db_instance_username, jsondecode(data.aws_secretsmanager_secret_version.current.secret_string)["password"], module.db.db_instance_endpoint)
    DB_DRIVER             = "postgres",
    SERVER_ADDRESS        = "0.0.0.0/8080",
    ACCESS_TOKEN_DURATION = 15,
    TOKEN_SYMMETRIC_KEY   = random_string.symmetric_key.id
  })
  recovery_window_in_days = 0
}

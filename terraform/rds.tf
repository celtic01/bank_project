module "db" {
  source     = "terraform-aws-modules/rds/aws"
  version    = "6.3.0"
  identifier = "pg-simplebank"

  # All available versions: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts
  engine                 = "postgres"
  engine_version         = "12.17"
  instance_class         = "db.t4g.small"
  publicly_accessible    = true
  allocated_storage      = 20
  max_allocated_storage  = 20
  vpc_security_group_ids = [module.rds_service_sg.security_group_id, "sg-09e0cf2f4d7363c37"]

  manage_master_user_password = true
  db_name                     = "simple_bank"
  username                    = "root"

  port                      = 5432
  create_db_parameter_group = false
  multi_az                  = false

  skip_final_snapshot = true
  deletion_protection = false
}

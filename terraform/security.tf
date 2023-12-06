module "rds_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "rds"
  description = "Security group for PostgreSQL publicly open"
  vpc_id      = data.aws_vpc.selected.id

  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

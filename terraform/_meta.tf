terraform {
  required_version = "~>1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.25.0"
    }
  }

  backend "s3" {
    encrypt = true
    region  = "us-west-2"
    key     = "simplebanktfstate123/terraform.tfstate"
  }
}

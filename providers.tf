terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.67.0"  # Had to force this version to make it work, will review version
    }
  }
}

provider "aws" {
  region = var.aws_region
}

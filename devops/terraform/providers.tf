

terraform {
  required_version = ">1.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0.0"
    }
  }

  backend "s3" {
    bucket         = "rs-terraform-statefile01"
    key            = "terraform-statefile"
    region         = "us-east-1"
  }
}

provider "aws" {
  region = var.REGION
}
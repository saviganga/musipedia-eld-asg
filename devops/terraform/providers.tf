

terraform {
  required_version = ">1.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "tf-backend-ganga"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}

provider "aws" {
  region = var.REGION
}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.99.0"
    }
  }

  # backend "s3" {

  # }
}

provider "aws" {
  # Configuration options
}
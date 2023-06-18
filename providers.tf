terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    #   version = "~> 4.0.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.my-access-key
  secret_key = var.my-secret-key
}
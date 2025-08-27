terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.70"
    }
    local = {
      source = "hashicorp/local"
      version = "~> 2.0"
    }
    null = {
      source = "hashicorp/null"
      version = "~> 3.0"
    }
    time = {
      source = "hashicorp/time"
      version = "~> 0.9"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.57.0"
    }
  }
  required_version = ">= 1.2.0"
}


provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Project     = "${var.project}"
      Environment = "Dev"
    }
  }
}
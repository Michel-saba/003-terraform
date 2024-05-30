terraform {
  cloud {
    organization = ""
    workspaces {
      name = "dev"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}


resource "aws_s3_bucket" "example" {
  bucket = "bucket-name"

  region = "us-west-2"
  tags = {
    public_bucket = false
  }
}
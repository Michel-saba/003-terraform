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
  region = "eu-west-3"
}


resource "aws_s3_bucket" "example" {
  bucket = "bucket-example"


  tags = {
    public_bucket = true
  }
}
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.example.id
  acl    = "public-read"
}
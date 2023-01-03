terraform {
  backend "s3" {
    bucket = "atlantis-tfstate-test"
    region = "us-west-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-buckettttttttt"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}
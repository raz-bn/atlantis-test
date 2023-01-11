terraform {
  backend "s3" {
    bucket = "atlantis-tfstate-test"
    key = "tfstate"
    region = "eu-west-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "tester" {
  ami           = "ami-0fe0b2cf0e1f25c8a"
  instance_type = "t2.small"

  tags = {
    Name = "HelloWorld"
  }
}

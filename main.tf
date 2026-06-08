terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
}

resource "aws_s3_bucket" "safran_bucket" {
  bucket = "safran-infra-amine-2026"

  tags = {
    Name        = "safran-bucket"
    Environment = "dev"
    Project     = "safran-aws-infra"
  }
}

resource "aws_instance" "safran_server" {
  ami           = "ami-0f61de2873e29e866"
  instance_type = "t3.micro"

  tags = {
    Name        = "safran-server"
    Environment = "dev"
    Project     = "safran-aws-infra"
  }
}

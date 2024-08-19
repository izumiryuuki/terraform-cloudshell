data "aws_caller_identity" "this" {}

terraform {
  required_version = "~> 1.9.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.63.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}


variable "aws_s3_bucket_name" {
    type = string
    default = "nothing"
}

resource "aws_s3_bucket" "terraform_cloudshell_demo" {
  bucket = "terraform-cloudshell-demo-${data.aws_caller_identity.this.account_id}"
}

resource "aws_s3_bucket_acl" "terraform_cloudshell_demo" {
  bucket = aws_s3_bucket.terraform_cloudshell_demo.id
  acl    = "private"
}

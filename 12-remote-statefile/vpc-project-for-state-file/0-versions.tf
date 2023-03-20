# Terraform Block
terraform {
  #  required_version = "~> 0.14" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
   # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "my-bucket-for-statefile-opeyemi-v1"
    key = "test/project-vpc-example/terraform.tfstate"
    region = "us-east-1"
    # Enable during Step-09     
    # For State Locking
    dynamodb_table = "test-project-vpc1"
  }
}

provider "aws" {
  region = var.aws_region
  profile = "default"
}

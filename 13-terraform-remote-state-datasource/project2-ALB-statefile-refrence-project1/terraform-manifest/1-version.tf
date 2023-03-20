terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.58.0"
    }
  }
   # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "my-bucket-for-statefile-opeyemi-v1"
    key = "dev/project2-alb-refrencing-project1-vpc/terraform.tfstate"
    region = "us-east-1"
    # For State Locking
   dynamodb_table = "dev-project2"
  }
  
}

provider "aws" {
  region = "eu-west-2"
  profile = "default"
}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.58.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
  profile = "default"
}

# Create Random Pet Resource
resource "random_pet" "this" {
  length = 2
}
# Input Variables

# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "eu-west-2"
}

# Enviroment variable
variable "environment" {
  description = "Enviroment Variable used as a prefix"
  type = string
  default = "dev"
}


# Business Division 
variable "business_divsion" {
  description = "Business Division in the large organization "
  type = string
  default = "HR"
}



variable "s3_bucket_name" {
  description = "my-s3-bucket-name"
  type = string
  default = "s3-ope-90993"
}

variable "my_s3_tags" {
  type = map(string)
  default = {
    Terraform = "true"
    Environment = "dev"
    newtag1 = "tag1"
    newtag2 = "tag2"
  }
}
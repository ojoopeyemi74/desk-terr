resource "aws_s3_bucket" "s3-bucket" {
  bucket = var.bucket-name
  force_destroy = true
  acl    = "private"
  versioning {
    enabled = var.versioning
  }


}



variable "bucket-name" {
  default = ""
}

variable "versioning" {
  default = ""
}
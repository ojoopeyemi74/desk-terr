module "my_s3_bucket" {
  source = "./module/aws-s3-static-website"
  bucket_name = var.s3_bucket_name

}


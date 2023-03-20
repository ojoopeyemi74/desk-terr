#####
# S3
#####
module "s3-bucket" {
  source      = "./modules/aws-s3"     ###########
  bucket-name = "opeyemi7498cloudfront" # Required
  versioning  = "false"                ###########

}
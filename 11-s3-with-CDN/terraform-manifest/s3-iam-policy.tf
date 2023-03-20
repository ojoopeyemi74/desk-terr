resource "aws_s3_bucket_policy" "s3_cloudfront_bucket" {
  bucket     = module.s3-bucket.bucket_name
  policy     = data.aws_iam_policy_document.s3-cloudfront-read_bucket_only.json
  depends_on = [time_sleep.wait_60_seconds]
}

################################
# S3 Bucket Public Access Block
################################
resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  bucket = module.s3-bucket.bucket_name

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  depends_on              = [time_sleep.wait_30_seconds]
}


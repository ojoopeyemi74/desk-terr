######################
# IAM Policy Document
######################
data "aws_iam_policy_document" "s3-cloudfront-read_bucket_only" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${module.s3-bucket.bucket_arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.cloudfront_origin_access_identity.iam_arn]
    }
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = [module.s3-bucket.bucket_arn]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.cloudfront_origin_access_identity.iam_arn]
    }
  }
  depends_on = [time_sleep.wait_30_seconds]
}

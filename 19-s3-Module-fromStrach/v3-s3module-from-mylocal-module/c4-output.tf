output "bucket_name" {
  description = "bucket name "
  value = module.my_s3_bucket.name
}

output "bucket_arn" {
  description = "bucket arn "
  value = module.my_s3_bucket.arn
}

output "bucket_domain_name" {
  description = "bucket domain_name "
  value = module.my_s3_bucket.bucket_domain_name
}

output "bucket_website_endpoint" {
  description = "bucket domain_name "
  value = module.my_s3_bucket.website_endpoint
}

output "bucket_website_domaint" {
  description = "bucket domain_name "
  value = module.my_s3_bucket.website_domain
}
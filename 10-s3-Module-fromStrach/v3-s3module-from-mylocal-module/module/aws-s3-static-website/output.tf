output "name" {
  description = "s3 bucket name(id)"
  value       = aws_s3_bucket.s3-website.id
}

output "arn" {
  description = "s3 bucket arn"
  value       = aws_s3_bucket.s3-website.arn
}

output "bucket_domain_name" {
  description = "s3 bucket bucket_domain_name"
  value       = aws_s3_bucket.s3-website.bucket_domain_name
}

output "website_endpoint" {
  description = "s3 bucket website_endpoint"
  value       = aws_s3_bucket.s3-website.website_endpoint
}

output "website_domain" {
  description = "s3 bucket website_domain"
  value       = aws_s3_bucket.s3-website.website_domain
}
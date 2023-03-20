# Get DNS information from AWS Route53
data "aws_route53_zone" "mydomain" {
  name = "neuniktechnologygroup.com"
}




#  Hosted Zone id of the desired Hosted Zone
output "hosted-zone-id" {
  description = "Hosted Zone id of the desired Hosted Zone."
  value       = data.aws_route53_zone.mydomain.zone_id
}

# Hosted Zone name of the desired Hosted Zone
output "hosted-zone-name" {
  description = "Hosted Zone name of the desired Hosted Zone"
  value       = data.aws_route53_zone.mydomain.name
}



module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "4.3.2"

  domain_name = trimsuffix(data.aws_route53_zone.mydomain.name, ".")
  zone_id     = data.aws_route53_zone.mydomain.zone_id

  subject_alternative_names = [
    "*.neuniktechnologygroup.com"
  ]



}

# amc certificate arn output 
output "acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = module.acm.acm_certificate_arn
}
module "private_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "private-sg"
  description = "Security group with HTTP and SSH port open or the entire VPC "
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["ssh-tcp", "http-80-tcp"]
  
  #Egress Rules
  egress_rules = ["all-all"]

  tags = local.common_tags 
}
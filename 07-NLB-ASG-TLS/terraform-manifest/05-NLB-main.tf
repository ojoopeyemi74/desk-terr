module "nlb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.4.0"

  name = "my-nlb"

  load_balancer_type = "network"

  vpc_id             = module.vpc.vpc_id
  subnets            = module.vpc.public_subnets

# TCP
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "TCP"
      target_group_index = 0
    },
  ]

  #  TLS
  https_listeners = [
    {
      port               = 443
      protocol           = "TLS"
      certificate_arn    = module.acm.acm_certificate_arn
      target_group_index = 0
    },
  ]
# Target group
target_groups = [
  #TG= Index 0
    {
      name_prefix          = "app1"
      backend_protocol     = "TCP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        matcher             = "200-399"
      }
    }
    
]

 tags = local.common_tags

}

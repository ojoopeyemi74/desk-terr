resource "aws_autoscaling_group" "asg" {
  name                      = "asg"
  max_size                  = 10
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 1
  launch_template {
    id = aws_launch_template.launch_template.id
    version = aws_launch_template.launch_template.latest_version
  }
  vpc_zone_identifier       = module.vpc.private_subnets

 target_group_arns =  module.alb.target_group_arns

 # Instance Refresh
 instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
    triggers = ["desired_capacity"]
  }


}
resource "aws_autoscaling_group" "asg" {
  name                      = "asg"
  max_size                  = 10
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 4
  launch_template {
    id = aws_launch_template.launch_template.id
    version = aws_launch_template.launch_template.latest_version
  }
  vpc_zone_identifier       = data.terraform_remote_state.vpc.outputs.private_subnets

 target_group_arns =  module.alb.target_group_arns

}
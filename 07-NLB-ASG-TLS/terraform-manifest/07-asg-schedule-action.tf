resource "aws_autoscaling_schedule" "increase_capacity_7am" {
  scheduled_action_name  = "increase_capacity_7am"
  min_size               = 1
  max_size               = 6
  desired_capacity       = 4
  start_time             = "2030-03-15T07:11:00Z"
  recurrence             = "00 07 * * *"
  autoscaling_group_name = aws_autoscaling_group.asg.name
}

resource "aws_autoscaling_schedule" "decrease_capacity_7am" {
  scheduled_action_name  = "decrease_capacity_7"
  min_size               = 1
  max_size               = 6
  desired_capacity       = 1
  start_time             = "2030-03-15T07:15:00Z"
  recurrence             = "00 08 * * *"
  autoscaling_group_name = aws_autoscaling_group.asg.name
}
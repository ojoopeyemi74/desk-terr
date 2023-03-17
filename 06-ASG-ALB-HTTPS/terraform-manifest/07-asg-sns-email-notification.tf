resource "aws_autoscaling_notification" "asg_email_notifications" {
  group_names = [aws_autoscaling_group.asg.name ]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.my_asg_sns_topic.arn
}

resource "aws_sns_topic" "my_asg_sns_topic" {
  name = "my_asg_sns_topic-${random_pet.this.id}"

}

resource "aws_sns_topic_subscription" "myasg_sns-email-subscription" {
  topic_arn = aws_sns_topic.my_asg_sns_topic.arn
  protocol  = "email"
  endpoint  = "ojo.opeyemi747474@gmail.com"
}
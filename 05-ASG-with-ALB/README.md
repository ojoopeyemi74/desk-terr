---
title: AWS Autoscaling with Launch Templates
description: Create AWS Autoscaling with Launch Templates using Terraform
---
# AWS Autoscaling with Launch Templates using Terraform
## Step-00: Introduction
- Create Launch Templates using Terraform Resources
- Create Autoscaling Group using Terraform Resources
- Create Autoscaling following features using Terraform Resources

## Step-02: Review existing configuration files
- Copy `c1 to c12` from Section-14 `14-Autoscaling-with-Launch-Configuration`

## Step-05: c13-02-autoscaling-launchtemplate-resource.tf
- Define [Launch Template Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template)
```t
# Launch Template Resource
resource "aws_launch_template" "my_launch_template" {
  name = "my-launch-template"
  description = "My Launch Template"
  image_id = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type

  vpc_security_group_ids = [module.private_sg.security_group_id]
  key_name = var.instance_keypair  
  user_data = filebase64("${path.module}/app1-install.sh")
  ebs_optimized = true
  #default_version = 1
  update_default_version = true
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = 10 
      #volume_size = 20 # LT Update Testing - Version 2 of LT      
      delete_on_termination = true
      volume_type = "gp2" # default is gp2
     }
  }
  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "myasg"
    }
  }
}
```

## Step-06: c13-03-autoscaling-resource.tf
- Define [Autoscaling Group Terraform Resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group)
```t
# Autoscaling Group Resource
resource "aws_autoscaling_group" "my_asg" {
  name_prefix = "myasg-"
  desired_capacity   = 2
  max_size           = 10
  min_size           = 2
  vpc_zone_identifier  = module.vpc.private_subnets
  target_group_arns = module.alb.target_group_arns
  health_check_type = "EC2"
  #health_check_grace_period = 300 # default is 300 seconds  
  # Launch Template
  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = aws_launch_template.my_launch_template.latest_version
  }
  
  tag {
    key                 = "Owners"
    value               = "Web-Team"
    propagate_at_launch = true
  }      
}
```

## Step-07: c13-04-autoscaling-with-launchtemplate-outputs.tf
- Define Launch Template and Autoscaling basic outputs
```t
# Launch Template Outputs
output "launch_template_id" {
  description = "Launch Template ID"
  value = aws_launch_template.my_launch_template.id
}

output "launch_template_latest_version" {
  description = "Launch Template Latest Version"
  value = aws_launch_template.my_launch_template.latest_version
}

# Autoscaling Outputs
output "autoscaling_group_id" {
  description = "Autoscaling Group ID"
  value = aws_autoscaling_group.my_asg.id 
}

output "autoscaling_group_name" {
  description = "Autoscaling Group Name"
  value = aws_autoscaling_group.my_asg.name 
}

output "autoscaling_group_arn" {
  description = "Autoscaling Group ARN"
  value = aws_autoscaling_group.my_asg.arn 
}
```




## Step-11: Execute Terraform Commands
```t
# Terraform Initialize
terraform init

# Terrafom Validate
terraform validate

# Terraform Plan
terraform plan

# Terraform Apply
terraform apply -auto-approve
```



- Execute Terraform Commands
```t
# Terraform Plan
terraform plan

# Terraform Apply
terraform apply -auto-approve

```

## Additional Troubleshooting
```
$ terraform import aws_launch_template.web lt-12345678

terraform import aws_launch_template.mytemp lt-02a572ea76508f68d
```


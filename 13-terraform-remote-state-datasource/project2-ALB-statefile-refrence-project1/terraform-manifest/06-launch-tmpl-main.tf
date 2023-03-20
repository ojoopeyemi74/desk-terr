resource "aws_launch_template" "launch_template" {
  name = "foo"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 20
    }
  }

 
  ebs_optimized = true

 
  image_id = data.aws_ami.amzlinux2.id

  instance_type = var.instance_type

  key_name = var.instance_keypair

  update_default_version = true

  
  monitoring {
    enabled = true
  }

  vpc_security_group_ids = [module.private_sg.security_group_id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "myasg"
    }
  } 

  user_data = filebase64("${path.module}/app1-install.sh")
}
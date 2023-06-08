##############################################################
# Auto Scaling
##############################################################
# 1) 시작 템플릿 구성
data "aws_ami" "amazon-ubuntu" {
  most_recent = true              # 가장 최신
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/*-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

# resource "aws_launch_configuration" "name" {
#   name_prefix = var.launchConfigName
#   image_id = data.aws_ami.amazon-ubuntu.id
#   instance_type = "t2.micro"
#   user_data = file("user-data.sh")
#   security_groups = ["sg-0e18c27ba7d520de3"]

#   lifecycle {
#     create_before_destroy = true
#   }
# }

resource "aws_launch_template" "launchTemp" {
  name_prefix = var.launchConfigName
  image_id = data.aws_ami.amazon-ubuntu.id
  instance_type = "t2.micro"
  user_data = base64encode("user-data.sh")
  security_group_names = [ "sg-0e18c27ba7d520de3" ]
  lifecycle {
    create_before_destroy = true
  }
}
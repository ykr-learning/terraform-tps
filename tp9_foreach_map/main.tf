#######   main.tf
provider "aws" {
  access_key = ""
  secret_key = ""
  region = "us-east-1"
}
#Get Linux AMI ID using SSM Parameter endpoint in us-east-1
data "aws_ssm_parameter" "linuxAmi" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}
#Create and bootstrap EC2 in us-east-1
resource "aws_instance" "ec2-vm" {
  for_each = var.project

  ami                         = data.aws_ssm_parameter.linuxAmi.value
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  tags = {
    Name = "${each.key}-${each.value.environment}-ec2"
  }
}

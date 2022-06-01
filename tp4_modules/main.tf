#######   main.tf
provider "aws" {
  access_key = var.var_access_key
  secret_key = var.var_secret_key
  region = "us-east-1"
}

###### module network
module "network" {
  source = "./modules/network"
}

#Get Linux AMI ID using SSM Parameter endpoint in us-east-1
data "aws_ssm_parameter" "linuxAmi" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}
#Create and bootstrap EC2 in us-east-1
resource "aws_instance" "ec2-vm" {
  ami                         = data.aws_ssm_parameter.linuxAmi.value
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.network.sg_id]
  subnet_id                   = module.network.subnet_id
  tags = {
    Name = "${var.var_username}-${terraform.workspace}-ec2"
  }
}

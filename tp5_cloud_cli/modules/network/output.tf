output "subnet_id"{
  value = aws_subnet.subnet.id
  description = "aws_subnet id"
}

output "sg_id"{
  value = aws_security_group.sg.id
  description = "aws_security_group id"
}

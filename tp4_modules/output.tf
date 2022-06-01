#ca permet d'afficher cette information a la fin du terraform apply

output "public_ip" {
    description = "Public IP of the VM"
    value = aws_instance.ec2-vm.public_ip
}

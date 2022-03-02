data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
  key_name = "kplabs-tf"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  provisioner "remote-exec" {
      inline = [
          "sudo yum update -y"
          "sudo yum install -y nginx",
          "sudo systemctl start nginx"
      ]
  }

  connection {
      type = "ssh"
      user = "ec2-user"
      private_key = var.TF_VAR_KPLABS_SSH
      host = self.public_ip
      timeout = "1m"
  }
}
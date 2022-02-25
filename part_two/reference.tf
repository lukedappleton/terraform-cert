# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm"]
  }
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
}

resource "aws_eip" "lb" {
    vpc = true
}

resource "aws_eip_association" "eip_assoc" {
    instance_id = aws_instance.myec2.id
    allocation_id = aws_eip.lb.id
}

resource "aws_security_group" "allow_tls" {
    name = "tf-class_group"
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
    }
}

resource "aws_iam_user" "lb" {
  name = var.elb_names[count.index]
  count = 3
  path = "/system/"
}

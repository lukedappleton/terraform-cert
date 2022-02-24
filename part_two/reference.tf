variable "AWS_ACCESS_KEY" {
  type = string
}

variable "AWS_SECRET_KEY" {
  type = string
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}

resource "aws_instance" "myec2" {
  ami           = "ami-0a8b4cd432b1c3063"
  instance_type = "t2.micro"
}

resource "aws_eip" "lb" {
    vpc = true
}

resource "aws_eip_association" "eip_assoc" {
    instance_id = aws_instance.myec2.id
    allocation_id = aws_eip.lb.id
}

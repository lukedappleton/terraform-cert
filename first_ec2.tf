terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "4.20.0"
    }
  }
}

provider "github" {
  # Configuration options
}
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
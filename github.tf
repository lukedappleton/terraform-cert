terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "4.20.0"
    }
  }
}

variable "GITHUB_TOKEN" {
  type = string
}

provider "github" {
  token = var.GITHUB_TOKEN
}

resource "github_repository" "tf-cert" {
  name        = "terraform-cert"
  visibility = "public"
}
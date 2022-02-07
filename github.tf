variable "GITHUB_TOKEN" {
  type = string
}

provider "github" {
  token = var.GITHUB_TOKEN
}

resource "github_repository" "tf-cert" {
  name        = "terraform-test"
  visibility = "public"
}
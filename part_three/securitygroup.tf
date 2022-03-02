resource "aws_security_group" "allow_ssh" {
    name = "tf-class_group"

    dynamic "ingress" {
        content {
            from_port = 22
            to_port = 22
            protocol = "tcp"
        }
    }
}
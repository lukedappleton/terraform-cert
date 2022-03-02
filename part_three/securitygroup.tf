resource "aws_security_group" "allow_ssh" {
    name = "tf-class_group"

    ingress {
        content {
            from_port = 22
            to_port = 22
            protocol = "tcp"
        }
    }
}
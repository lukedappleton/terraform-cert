resource "aws_security_group" "allow_ssh" {
    name = "tf-class_group"

    ingress {
        cidr_blocks = [ "0.0.0.0/0", ]
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }
}
resource "aws_security_group" "allow_tls" {
    name = "tf-class_group"
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
    }
}
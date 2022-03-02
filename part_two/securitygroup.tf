resource "aws_security_group" "allow_tls" {
    name = "tf-class_group"
    dynamic "ingress" {
        for_each = var.sg_ports
        content = {
        from_port = ingress.value
        to_port = ingress.value
        protocol = "tcp"
        cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
        }
    }
}
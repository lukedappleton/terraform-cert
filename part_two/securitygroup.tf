resource "aws_security_group" "allow_tls" {
    name = "tf-class_group"

    dynamic "ingress" {
        for_each = var.sg_ports
        iterator = port
        content {
            from_port = port.value
            to_port = port.value
            protocol = "tcp"
            cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
        }
    }

        dynamic "egress" {
        for_each = var.sg_ports
        iterator = port
        content {
            from_port = port.value
            to_port = port.value
            protocol = "tcp"
            cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
        }
    }
}
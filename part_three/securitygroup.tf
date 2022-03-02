resource "aws_security_group" "allow_ssh" {
    name = "tf-class_group"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.allow_ssh.id
  network_interface_id = aws_instance.myec2.primary_network_interface_id
}
resource "aws_security_group" "FrontEnd" {
  name = "FrontEnd"

  tags {
    Name = "FrontEnd"
  }

  description = "ONLY HTTP CONNECTION INBOUD"
  vpc_id      = "${aws_vpc.terraformmain.id}"

  ingress {
    from_port   = 4000
    to_port     = 4000
    protocol    = "TCP"
    cidr_blocks = "${var.whitelist_ips}"
  }

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "TCP"
    cidr_blocks = "${var.whitelist_ips}"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
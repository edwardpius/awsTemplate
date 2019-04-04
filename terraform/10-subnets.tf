resource "aws_subnet" "PublicAZA" {
  vpc_id     = "${aws_vpc.terraformmain.id}"
  cidr_block = "${var.subnet_public_AzA_cidr}"

  tags {
    Name = "PublicAZA"
  }

  availability_zone = "${data.aws_availability_zones.available.names[0]}"
}

resource "aws_route_table_association" "PublicAZA" {
  subnet_id      = "${aws_subnet.PublicAZA.id}"
  route_table_id = "${aws_route_table.public.id}"
}
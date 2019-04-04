output "nodeapp_public_ip" {
  value = "${aws_instance.nodeapp.public_ip}"
}

output "nodeapp_public_dns" {
  value = "${aws_instance.nodeapp.public_dns}"
}

output "nodeapp_private_ip" {
  value = "${aws_instance.nodeapp.private_ip}"
}

output "nodeapp_private_dns" {
  value = "${aws_instance.nodeapp.private_dns}"
}

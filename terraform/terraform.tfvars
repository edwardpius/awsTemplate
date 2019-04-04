aws_region = "us-east-1"
aws_access_key = "<AWS ACCESS KEY>"
aws_secret_key = "<AWS SECRET>"
ami_linux_images = {
    us-east-1 = "ami-b73b63a0"
    us-west-2 = "ami-5ec1673e"
    eu-west-1 = "ami-9398d3e0"
}
vpc_cidr = "172.28.0.0/16"
subnet_public_AzA_cidr = "172.28.1.0/24"
whitelist_ips = ["<IP to Whitelist>"]
instance_user_home = "/home/ec2-user"
instance_key = "<ssh key - e+g value of id_rsa.pub>"
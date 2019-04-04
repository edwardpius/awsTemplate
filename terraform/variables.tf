variable "aws_region" {
  description = "AWS Region"
}

variable "ami_linux_images" {
  description = "AMI Images for regions"
  type        = "map"
}

variable "aws_access_key" {
  description = "AWS Key"
}

variable "aws_secret_key" {
  description = "AWS Secret"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
}

variable "subnet_public_AzA_cidr" {
  description = "Subnet Public A CIDR"
}

variable "whitelist_ips" {
  description = "IP Whitelist for SG"
  type        = "list"
}

variable "instance_user_home" {
  description = "User Home directory"
}

variable "instance_key" {
  description = "Instance PEM Key"
}

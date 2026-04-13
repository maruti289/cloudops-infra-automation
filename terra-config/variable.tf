variable "aws_region" {
  default = "eu-north-1"
}

variable "ami_id" {
  default = "PASTE_AMI_ID_HERE"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "environments" {
  default = ["dev", "stage", "prod"]
}

variable "key_name" {
  default = "tester-key"
}

variable "public_key_path" {
  default = "~/.ssh/appKey.pub"
}
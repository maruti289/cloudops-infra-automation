variable "aws_region" {
  default = "eu-north-1"
}

variable "ami_id" {
  default = "ami-0a4640f53fa171eb4"
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
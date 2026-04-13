output "dev_ips" {
  value = [
    aws_instance.web["dev-1"].public_ip,
    aws_instance.web["dev-2"].public_ip
  ]
}

output "stage_ips" {
  value = [
    aws_instance.web["stage-1"].public_ip,
    aws_instance.web["stage-2"].public_ip
  ]
}

output "prod_ips" {
  value = [
    aws_instance.web["prod-1"].public_ip,
    aws_instance.web["prod-2"].public_ip
  ]
}
output "ec2_id" {
  value = aws_instance.mini_projet_terraform.id
}

output "ec2_zone" {
  value = aws_instance.mini_projet_terraform.availability_zone
}
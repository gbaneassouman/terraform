output "ec2_eip_id" {
  value = aws_eip.ec2_lb.id
}

output "ec2_eip" {
  value = aws_eip.ec2_lb.public_ip
}
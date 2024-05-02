output "ec2_security_group_id" {
  value = aws_security_group.allow_http_https_ssh.name
}
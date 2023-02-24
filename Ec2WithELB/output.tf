output "dns" {
  value = "http://${aws_instance.nginx1.public_dns}"
}


output "aws_instance_public_dns" {
  value = aws_lb.nginx.dns_name
}
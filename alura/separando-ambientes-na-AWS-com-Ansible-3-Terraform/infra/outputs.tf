output "dns" {
  value = aws_instance.app_server.public_dns
}


output "IP_publico" {
  value = aws_instance.app_server.public_ip
}
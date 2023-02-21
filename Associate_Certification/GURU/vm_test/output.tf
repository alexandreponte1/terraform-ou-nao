output "dns" {
  value = "http://${aws_instance.web1.public_dns}"
}
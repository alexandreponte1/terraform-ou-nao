output "dns" {
  value = "http://${module.ec2_instance.public_dns}"
}
data "aws_security_group" "selected" {
  filter {
    name   = "group-name"
    values = ["default"]
  }
}

output "SG" {
  value = data.aws_security_group.selected
}
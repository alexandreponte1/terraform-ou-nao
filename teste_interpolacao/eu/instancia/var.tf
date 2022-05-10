variable "aws_region" {
  type = string
  description = " "
  default = "us-east-1"
}


variable "aws_profile" {
  type = string
  description = " "
  default = "cloud"
}


variable "instance_ami" {
  type = string
  description = " "
  default = "ami-09e67e426f25ce0d7"
}

variable "instance_type" {
  type = string
  description = " "
  default = "t2.micro"
}


variable "instance_tags" {
  type = map(string)
  description = " "
  default = {
      name = "Ubuntu"
      Project = "Curso AWS com Terraform"
  }
}
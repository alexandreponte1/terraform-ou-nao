variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "playground"
}


variable "cdirs_acesso_remoto" {
  type    = list(string)
  default = ["seu-ip/32"]
}
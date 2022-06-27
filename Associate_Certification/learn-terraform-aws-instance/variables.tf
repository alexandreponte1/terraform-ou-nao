variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "default"
}

variable "cdirs_acesso_remoto" {
  type    = list(string)
  default = ["0.0.0.0./00"]
}


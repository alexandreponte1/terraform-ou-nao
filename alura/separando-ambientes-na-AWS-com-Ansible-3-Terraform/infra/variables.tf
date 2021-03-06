variable "aws_region" {
  type        = string
  description = ""
  # default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "playground"
}


variable "cdirs_acesso_remoto" {
  type    = list(string)
  default = ["0.0.0.0./00"]
}

variable "chave" {
  type = string
}
variable "instancia" {
  type = string
}

variable "grupo_seguranca" {
  type = string
}

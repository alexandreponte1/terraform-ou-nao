variable "aws_profile" {
  type        = string
  description = ""
  default     = "default"
}


variable "regiao_aws" {
  type    = string
  default = "us-east-1"

}

# variable "cdirs_acesso_remoto" {
#   type    = list(string)
#   default = ["0.0.0.0./00"]
# }

variable "nome_repositorio" {
  type = string
}


variable "cargoIAM" {
  type = string
}


variable "ambiente" {
  type = string
}
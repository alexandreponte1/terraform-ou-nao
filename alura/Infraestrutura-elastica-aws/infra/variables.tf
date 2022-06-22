variable "regiao_aws" {
  type = string
}
variable "chave" {
  type = string
}
variable "instancia" {
  type = string
}

variable "grupoDeSeguranca" {
  type = string
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


variable "minimo" {
  type = number
}

variable "maximo" {
  type = number
}

variable "nomeGrupo" {
  type = string
}

variable "producao" {
  type = bool
}
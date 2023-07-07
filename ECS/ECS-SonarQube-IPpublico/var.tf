variable "cdirs_acesso_remoto" {
  type    = list(string)
  default = ["0.0.0.0/0"] # recomendo colocar o seu ip aqui /32
}


variable "aws_profile" {
  type        = string
  description = " "
  default     = "playground"
}



variable "ambiente" {
  type        = string
  description = " "
  default     = "SonarQube"
}

variable "cargoIAM" {
  type    = string
  default = "producao"
}
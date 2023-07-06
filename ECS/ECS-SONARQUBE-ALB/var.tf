variable "aws_profile" {
  type        = string
  description = " "
  default     = "playground"
}


variable "regiao_aws" {
  type    = string
  default = "us-east-1"

}
variable "nome_repositorio" {
  type    = string
  default = "producao"

}

variable "cargoIAM" {
  type    = string
  default = "producao"
}

variable "ambiente" {
  type    = string
  default = "producao"
}
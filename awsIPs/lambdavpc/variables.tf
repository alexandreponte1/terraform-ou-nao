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

variable "service_name" {
  type        = string
  description = ""
  default     = "jupiter"
}


variable "accountId" {
  type    = string
  default = "944008058129"
}


variable "cdirs_acesso_remoto" {
  type    = list(string)
  default = ["0.0.0.0/0"] # recomendo colocar o seu ip aqui /32
}


variable "function_name" {
  default = "firstFunction"
  
}
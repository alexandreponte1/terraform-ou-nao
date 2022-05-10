variable "amis" {
  type = map(string)

  default = {
    "us-east-1" = "ami-042e8287309f5df03"
    "us-east-2" = "ami-077e31c4939f6a2f3"
  }
}

variable "cdirs_acesso_remoto" {
  type    = list(string)
  default = ["0.0.0.0./32"]
}

#removi a variavel, pois estamos buscando a versão mais recente da AMI via data.

# variable "amis" {
#   type = map(string)
# #Altere a imagem conforme a região
# # aqui estamos usando a imagem do ubuntu devido ao script.ssh
#   default = {
#     "us-east-1" = "ami-0557a15b87f6559cf"
#     "us-east-2" = "ami-08c40ec9ead489470"
#   }
# }


#Recomendo configurar um profile
#https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html
variable "aws_profile" {
  type        = string
  description = " "
  default     = "playground"
}


variable "prodNAME" {
  type    = string
  default = "PRDUCAO"

}


variable "devNAME" {
  type    = string
  default = "GOKUGOKUGOKUGOKUGOKUGOKUGOKUGOKUGOKUGOKUGOKUGOKU"

}
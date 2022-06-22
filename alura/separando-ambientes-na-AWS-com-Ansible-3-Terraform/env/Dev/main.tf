module "aws-dev" {
  source          = "../../infra"
  instancia       = "t1.micro"
  aws_region      = "us-east-1"
  chave           = "IaC-DEV"
  grupo_seguranca = "dev"
}


output "IP" {
  value = module.aws-dev.IP_publico
}
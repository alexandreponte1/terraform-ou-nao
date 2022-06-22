module "aws-prod" {
  source          = "../../infra"
  instancia       = "t2.micro"
  aws_region      = "us-east-1"
  chave           = "IaC-Prod"
  grupo_seguranca = "prod"
}

output "IP" {
  value = module.aws-prod.IP_publico
}
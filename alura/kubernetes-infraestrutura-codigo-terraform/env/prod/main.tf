module "prod" {
  source           = "../../Infra"
  nome_repositorio = "producao"
  cluster_name     = "producao"
}



output "endereco" {
  value = module.prod.URL
}
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  #Criar a variável TF_VAR_gcpkey apontando para o arquivo json da conta de serviço
  credentials = file(var.gcpkey)
  project     = var.project_id
  region      = var.region
  #zone    = "us-central1-c"
}


# resource "google_project_service" "gcpservices" {
#   for_each = toset(var.gcp_service_list)
#   project  = var.project_id
#   service  = each.key

#   timeouts {
#     create = "30m"
#     update = "40m"
#   }

#   disable_dependent_services = true
# }




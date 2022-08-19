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

#Enable thin in console
#serviceusage.googleapis.com
#cloudresourcemanager.googleapis.com



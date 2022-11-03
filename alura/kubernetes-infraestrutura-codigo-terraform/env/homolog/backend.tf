terraform {
  backend "s3" {
    bucket = "terraform-state-alexandre"
    key    = "homolog/terraform.tfstate"
    region = "us-east-1"
  }
}
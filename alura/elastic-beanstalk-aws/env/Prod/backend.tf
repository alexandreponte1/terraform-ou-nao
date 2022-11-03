terraform {
  backend "s3" {
    bucket = "terraform-state-alexandree"
    key    = "Prod/terraform.tfstate"
    region = "us-east-1"
  }
}
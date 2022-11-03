provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

resource "random_pet" "petname" {
  length    = 5
  separator = "-"
}

resource "aws_s3_bucket" "sample" {
  bucket = random_pet.petname.id

  # acl    = "public-read"
  # region = var.aws_region

  tags = {
    public_bucket = true
  }
}



provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-tf-test-bucket-goku333322222dslkjd1"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    ManagedBy   = "terraform"
    owner       = "Alexandre"
    updatedAt   = "2021-01-18"
  }
}
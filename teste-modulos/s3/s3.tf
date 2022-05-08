module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "eu-s3-balde"
  acl    = "private"

  versioning = {
    enabled = true
  }

}

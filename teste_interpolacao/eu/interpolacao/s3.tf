resource "aws_s3_bucket" "this" {
  bucket = "${random_pet.bucket.id}-${var.environment}"
  acl    = "private"

  tags = local.common_tags
}


resource "aws_s3_bucket_object" "this" {
  bucket       = aws_s3_bucket.this.bucket
  key          = "config/${local.ip_filepath}"
  source       = local.ip_filepath
  etag         = filemd5(local.ip_filepath)
  content_type = "image/jpeg"

  tags = local.common_tags
}

resource "aws_s3_bucket_object" "random" {
  bucket       = aws_s3_bucket.this.bucket
  key          = "config/${random_pet.bucket.id}.json"
  source       = local.ip_filepath
  etag         = filemd5(local.ip_filepath)
  content_type = "image/jpeg"

  tags = local.common_tags
}

resource "aws_s3_bucket" "manual" {
  bucket = "testealexandre123"
  tags = {
    criado    = "18/08/2021"
    Importado = "18/08/2021"
    ManagedBy = "Terraform"
  }
}


#terraform import aws_s3_bucket.manual testealexandre123

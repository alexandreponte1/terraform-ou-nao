resource "aws_s3_bucket" "fly" {
  bucket = "fly12345678901"
  tags = {
    Name        = "meu_teste"
    Environment = "eita"
  }
}
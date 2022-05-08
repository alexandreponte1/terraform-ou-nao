output "lambda_teste" {
  value = aws_lambda_function.myLambda.arn
}

output "s3_arn" {
  value = aws_s3_bucket.fly.arn
}
output "base_url" {
  value = aws_api_gateway_deployment.apideploy.invoke_url
}


output "lambda_arn" {
  value = aws_lambda_function.test_lambda.invoke_arn
}


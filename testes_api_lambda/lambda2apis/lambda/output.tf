output "base_url1" {
  value = data.aws_api_gateway_rest_api.api1.id
}



output "base_url2" {
  value = data.aws_api_gateway_rest_api.api2.id
}


output "lambdaarn" {
  value = aws_lambda_function.myLambda.arn
}
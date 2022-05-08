output "base_url" {
  value = aws_api_gateway_deployment.apideploy.invoke_url
}

output "base_url2" {
  value = aws_api_gateway_deployment.apideploy2.invoke_url
}
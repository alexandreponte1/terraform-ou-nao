output "base_url" {
  value = aws_api_gateway_deployment.apideploy.invoke_url
}

# output "cognito_pool_id" {
#   value = aws_cognito_user_pool.this.id
# }

# output "cognito_client_id" {
#   value = aws_cognito_user_pool_client.this.id
# }

# output "cognito_app_client_id_app" {
#   value = aws_cognito_user_pool_client.app.id
# }


# output "cognito_pool_endpoint" {
#   value = aws_cognito_user_pool.this.endpoint
# }

# output "cognito_domain" {
#   value = aws_cognito_user_pool_domain.this.domain
# }

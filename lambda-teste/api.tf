################ API GATEWAY ################

resource "aws_api_gateway_rest_api" "alexandre" {
  name = "alexandre"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "usuario" {
  rest_api_id = aws_api_gateway_rest_api.alexandre.id
  parent_id   = aws_api_gateway_rest_api.alexandre.root_resource_id
  path_part   = "usuario"
}

// GET
resource "aws_api_gateway_method" "get" {
  rest_api_id      = aws_api_gateway_rest_api.alexandre.id
  resource_id      = aws_api_gateway_resource.usuario.id
  http_method      = "GET"
  authorization    = "NONE"
  api_key_required = false
}

resource "aws_api_gateway_integration" "integration-get" {
  rest_api_id             = aws_api_gateway_rest_api.alexandre.id
  resource_id             = aws_api_gateway_resource.usuario.id
  http_method             = aws_api_gateway_method.get.http_method
  integration_http_method = "GET"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.test_lambda.invoke_arn
}

# resource "aws_api_gateway_model" "this" {
#   rest_api_id  = aws_api_gateway_rest_api.alexandre.id
#   name         = "Empty"
#   description  = "a JSON schema"
#   content_type = "application/json"

#   schema = <<EOF
# {
#   "type": "object"
# }
# EOF
# }


resource "aws_api_gateway_method_response" "response_200" {
  rest_api_id = aws_api_gateway_rest_api.alexandre.id
  resource_id = aws_api_gateway_resource.usuario.id
  http_method = aws_api_gateway_method.get.http_method
  status_code = "200"
  # content_type = "application/json"
  response_models = {
    "application/json" = "Empty"
  }

}



################ Deployment of API gateway ################

resource "aws_api_gateway_deployment" "dev" {
  rest_api_id = aws_api_gateway_rest_api.alexandre.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.alexandre.body))
  }

  depends_on = [aws_api_gateway_integration.integration-get]
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "dev" {
  deployment_id = aws_api_gateway_deployment.dev.id
  rest_api_id   = aws_api_gateway_rest_api.alexandre.id
  stage_name    = "dev"
}
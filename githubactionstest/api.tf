resource "aws_api_gateway_rest_api" "apiLambda" {
  name = "goku"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}


resource "aws_api_gateway_resource" "login" {
  rest_api_id = aws_api_gateway_rest_api.apiLambda.id
  parent_id   = aws_api_gateway_rest_api.apiLambda.root_resource_id
  path_part   = "login"
}


resource "aws_api_gateway_method" "any" {
  rest_api_id   = aws_api_gateway_rest_api.apiLambda.id
  resource_id   = aws_api_gateway_resource.login.id
  authorization = "NONE"
  http_method   = "ANY"
}

resource "aws_api_gateway_integration" "lambda" {
  rest_api_id = aws_api_gateway_rest_api.apiLambda.id
  resource_id = aws_api_gateway_method.any.resource_id
  http_method = aws_api_gateway_method.any.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.myLambda.invoke_arn
}


resource "aws_api_gateway_method" "any_root" {
  rest_api_id   = aws_api_gateway_rest_api.apiLambda.id
  resource_id   = aws_api_gateway_rest_api.apiLambda.root_resource_id
  authorization = "NONE"
  http_method   = "ANY"
}

resource "aws_api_gateway_integration" "lambda_root" {
  rest_api_id = aws_api_gateway_rest_api.apiLambda.id
  resource_id = aws_api_gateway_method.any_root.resource_id
  http_method = aws_api_gateway_method.any_root.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.myLambda.invoke_arn
}

################ Deployment of API gateway ################
resource "aws_api_gateway_deployment" "apideploy" {
  depends_on = [
    aws_api_gateway_integration.lambda,
    aws_api_gateway_integration.lambda_root,
  ]

  rest_api_id = aws_api_gateway_rest_api.apiLambda.id
  stage_name  = "test"
}

resource "aws_api_gateway_deployment" "apideploy2" {
  depends_on = [
    aws_api_gateway_integration.lambda,
    aws_api_gateway_integration.lambda_root,
  ]

  rest_api_id = aws_api_gateway_rest_api.apiLambda.id
  stage_name  = "prod"
}




resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.myLambda.function_name
  principal     = "apigateway.amazonaws.com"

  # The "/*/*" portion grants access from any method on any resource
  # within the API Gateway REST API.
  source_arn = "${aws_api_gateway_rest_api.apiLambda.execution_arn}/*/*"
}




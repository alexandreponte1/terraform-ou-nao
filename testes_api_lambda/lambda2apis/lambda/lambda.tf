data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "hello.py"
  output_path = "lambda_function.zip"
}

resource "aws_lambda_function" "myLambda" {
  filename         = "lambda_function.zip"
  function_name    = "firstFunction"
  role             = aws_iam_role.lambda_role.arn
  handler          = "hello.lambda_handler"
  runtime          = "python3.8"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

}

# IAM role which dictates what other AWS services the Lambda function
# may access.
resource "aws_iam_role" "lambda_role" {
  name = "role_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}



data "aws_api_gateway_rest_api" "api1"{
  name = "api-${var.api_name1}"
}


data "aws_api_gateway_rest_api" "api2"{
  name = "api-${var.api_name2}"
}



#########################API1##################################################

resource "aws_api_gateway_resource" "api1" {
  rest_api_id = data.aws_api_gateway_rest_api.api1.id
  parent_id   = data.aws_api_gateway_rest_api.api1.root_resource_id
  path_part   = var.api_name1
}

resource "aws_api_gateway_method" "proxyMethod" {
  rest_api_id   = data.aws_api_gateway_rest_api.api1.id
  resource_id   = aws_api_gateway_resource.api1.id
  http_method   = "ANY"
  authorization = "NONE"
}


resource "aws_api_gateway_integration" "lambda" {
  rest_api_id = data.aws_api_gateway_rest_api.api1.id
  resource_id = aws_api_gateway_method.proxyMethod.resource_id
  http_method = aws_api_gateway_method.proxyMethod.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.myLambda.invoke_arn
}

resource "aws_api_gateway_method" "proxy_root" {
  rest_api_id   = data.aws_api_gateway_rest_api.api1.id
  resource_id   = data.aws_api_gateway_rest_api.api1.root_resource_id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_root" {
  rest_api_id = data.aws_api_gateway_rest_api.api1.id
  resource_id = aws_api_gateway_method.proxy_root.resource_id
  http_method = aws_api_gateway_method.proxy_root.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.myLambda.invoke_arn
}


resource "aws_api_gateway_deployment" "apideploy" {
  depends_on = [
    aws_api_gateway_integration.lambda,
    aws_api_gateway_integration.lambda_root,
  ]

  rest_api_id = data.aws_api_gateway_rest_api.api1.id
  stage_name  = "test"
}


resource "aws_lambda_permission" "apigw" {
  statement_id  = "AllowAPIGatewayInvokegohan"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.myLambda.function_name
  principal     = "apigateway.amazonaws.com"

  # The "/*/*" portion grants access from any method on any resource
  # within the API Gateway REST API.
  source_arn = "${data.aws_api_gateway_rest_api.api1.execution_arn}/*/*"
}




###########################API2################################################



resource "aws_api_gateway_resource" "api2" {
  rest_api_id = data.aws_api_gateway_rest_api.api2.id
  parent_id   = data.aws_api_gateway_rest_api.api2.root_resource_id
  path_part   = var.api_name2
}

resource "aws_api_gateway_method" "proxyMethod2" {
  rest_api_id   = data.aws_api_gateway_rest_api.api2.id
  resource_id   = aws_api_gateway_resource.api2.id
  http_method   = "ANY"
  authorization = "NONE"
}


resource "aws_api_gateway_integration" "lambdaapi2" {
  rest_api_id = data.aws_api_gateway_rest_api.api2.id
  resource_id = aws_api_gateway_method.proxyMethod2.resource_id
  http_method = aws_api_gateway_method.proxyMethod2.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.myLambda.invoke_arn
}


resource "aws_api_gateway_method" "proxy_rootapi2" {
  rest_api_id   = data.aws_api_gateway_rest_api.api2.id
  resource_id   = data.aws_api_gateway_rest_api.api2.root_resource_id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_rootapi2" {
  rest_api_id = data.aws_api_gateway_rest_api.api2.id
  resource_id = aws_api_gateway_method.proxy_rootapi2.resource_id
  http_method = aws_api_gateway_method.proxy_rootapi2.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.myLambda.invoke_arn
}



resource "aws_api_gateway_deployment" "apideployapi2" {
  depends_on = [
    aws_api_gateway_integration.lambdaapi2,
    aws_api_gateway_integration.lambda_rootapi2,
  ]

  rest_api_id = data.aws_api_gateway_rest_api.api2.id
  stage_name  = "test"
}


resource "aws_lambda_permission" "apigwapi2" {
  statement_id  = "AllowAPIGatewayInvokeapigwapi2"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.myLambda.function_name
  principal     = "apigateway.amazonaws.com"

  # The "/*/*" portion grants access from any method on any resource
  # within the API Gateway REST API.
  source_arn = "${data.aws_api_gateway_rest_api.api2.execution_arn}/*/*"
}

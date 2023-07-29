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


resource "aws_api_gateway_resource" "api1" {
  rest_api_id = data.aws_api_gateway_rest_api.api1.id
  parent_id   = data.aws_api_gateway_rest_api.api1.root_resource_id
  path_part   = var.api_name1
}

esource "aws_api_gateway_method" "proxyMethod" {
  rest_api_id   = data.aws_api_gateway_rest_api.api1.id
  resource_id   = aws_api_gateway_resource.request_terra.id
  http_method   = "ANY"
  authorization = "NONE"
}



###########################################################################



resource "aws_api_gateway_resource" "api2" {
  rest_api_id = data.aws_api_gateway_rest_api.api2.id
  parent_id   = data.aws_api_gateway_rest_api.api2.root_resource_id
  path_part   = var.api_name2
}
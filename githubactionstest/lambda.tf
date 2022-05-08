data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "hello.py"
  output_path = "lambda_function.zip"
}

resource "aws_lambda_function" "myLambda" {
  filename      = "lambda_function.zip"
  function_name = "firstFunction"
  role          = aws_iam_role.lambda_role.arn
  handler       = "hello.lambda_handler"
  runtime       = "python3.8"
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

data "archive_file" "lambda_zip" {
  source_file = "hello.py"
  output_path = "lambda_function.zip"
  type        = "zip"
}



resource "aws_lambda_function" "myLambda" {
  filename         = "lambda_function.zip"
  function_name    = "myyyFunction"
  role             = aws_iam_role.lambda_role.arn
  handler          = "hello.lambda_handler"
  runtime          = "python3.8"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

}



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


resource "aws_iam_role_policy_attachment" "s3_role_to_lambda" {
  role       = aws_iam_role.lambda_role.id
  policy_arn = aws_iam_policy.lambda_policy_s3.arn
}
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "hello.py"
  output_path = "lambda_function.zip"
}

resource "aws_lambda_function" "myLambda" {
  filename      = "lambda_function.zip"
  function_name = "lambda-1-${substr("${local.api_artifact_name}", 0, min(64, length(local.api_artifact_name)))}"
  #function_name = "firstFunction"
  role             = aws_iam_role.lambda_role.arn
  handler          = "hello.lambda_handler"
  runtime          = "python3.8"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

}


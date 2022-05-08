resource "aws_lambda_event_source_mapping" "event_source_mapping" {
  event_source_arn = aws_sqs_queue.voar.arn
  enabled          = true
  function_name    = aws_lambda_function.myLambda.arn
  batch_size       = 1
}
resource "aws_sqs_queue" "sqs_back" {
  name                        = "sqs_back.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
  visibility_timeout_seconds  = 30
  message_retention_seconds   = 345600
  max_message_size            = 262144
  receive_wait_time_seconds   = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.sqs_deadletter.arn
    maxReceiveCount     = 4
  })
  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = ["${aws_sqs_queue.sqs_deadletter.arn}"]
  })
}



resource "aws_sqs_queue" "sqs_deadletter" {
  name                        = "sqs_deadletter.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
  visibility_timeout_seconds  = 30
  message_retention_seconds   = 345600
  max_message_size            = 262144
}
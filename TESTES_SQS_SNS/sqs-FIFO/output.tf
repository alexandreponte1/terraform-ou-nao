output "sqs_back_arn" {
  value = aws_sqs_queue.sqs_back.arn
}

output "sqs_back_dead_arn" {
  value = aws_sqs_queue.sqs_deadletter.arn
}
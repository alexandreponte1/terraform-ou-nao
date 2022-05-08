output "back_sqs_arn" {
  value = aws_sqs_queue.back_sqs.arn
}

output "data_sqs_arn" {
  value = aws_sqs_queue.data_sqs.arn
}


output "sns_arn" {
  value = aws_sns_topic.meusns.arn
}
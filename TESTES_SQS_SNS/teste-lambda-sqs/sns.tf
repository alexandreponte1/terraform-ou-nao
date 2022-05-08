resource "aws_sns_topic" "voar" {
  name = "voarSNS"
}

resource "aws_sns_topic_subscription" "voarsub" {
  topic_arn = aws_sns_topic.voar.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.voar.arn
}


resource "aws_sns_topic" "meusns" {
  name = "meusns"
}

resource "aws_sns_topic_subscription" "mysub" {
  topic_arn = aws_sns_topic.meusns.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.back_sqs.arn

  filter_policy = <<EOF
  {
    "joao": ["Nao_ta_em_casa"]
  }
  EOF
}




resource "aws_sns_topic_subscription" "mysub2" {
  topic_arn = aws_sns_topic.meusns.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.data_sqs.arn

  filter_policy = <<EOF
  {
    "maria": ["Nao_ta_em_casa"]
  }
  EOF
}
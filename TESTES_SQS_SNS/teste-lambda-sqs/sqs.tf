resource "aws_sqs_queue" "voar" {
  name                       = "voarSQS"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 345600
  max_message_size           = 262144
  receive_wait_time_seconds  = 10
}

resource "aws_sqs_queue_policy" "sqs_policy" {
  queue_url = aws_sqs_queue.voar.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [{
      "Sid": "Allow-SNS-SendMessage",
      "Effect": "Allow",
      "Principal": {
        "Service": "sns.amazonaws.com"
      },
      "Action": [
      "sqs:SendMessage",
      "sqs:DeleteMessage"
      ],
      "Resource": "${aws_sqs_queue.voar.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sns_topic.voar.arn}"
        }
      }
    }]
  }
POLICY
}
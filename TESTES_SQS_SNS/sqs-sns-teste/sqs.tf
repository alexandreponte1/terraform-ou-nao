resource "aws_sqs_queue" "back_sqs" {
  name                       = "back_sqs"
  visibility_timeout_seconds = 40
  message_retention_seconds  = 345600
  max_message_size           = 262144
  receive_wait_time_seconds  = 10
}

resource "aws_sqs_queue_policy" "sqs_policy" {
  queue_url = aws_sqs_queue.back_sqs.id

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
      "Resource": "${aws_sqs_queue.back_sqs.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sns_topic.meusns.arn}"
        }
      }
    }]
  }
POLICY
}


resource "aws_sqs_queue" "data_sqs" {
  name                       = "data_sqs"
  visibility_timeout_seconds = 40
  message_retention_seconds  = 345600
  max_message_size           = 262144
  receive_wait_time_seconds  = 10
}

resource "aws_sqs_queue_policy" "sqs_policy2" {
  queue_url = aws_sqs_queue.data_sqs.id

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
      "Resource": "${aws_sqs_queue.data_sqs.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sns_topic.meusns.arn}"
        }
      }
    }]
  }
POLICY
}



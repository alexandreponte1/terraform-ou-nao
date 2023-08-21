resource "aws_sns_topic" "sns" {
  name = "lambdaTopic"

}


resource "aws_sns_topic_subscription" "subscription" {
  topic_arn = aws_sns_topic.sns.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.myLambda.arn
}
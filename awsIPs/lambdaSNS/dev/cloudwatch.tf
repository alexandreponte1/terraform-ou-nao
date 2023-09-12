# data "aws_sns_topic" "sns" {
#   name = "${var.sns_name}-${var.function_name}"
# }

# resource "aws_cloudwatch_metric_alarm" "alarm" {
#   dimensions = {
#     "FunctionName" = "${var.function_name}"
#   }

#   alarm_actions = [
#     data.aws_sns_topic.sns.arn
#   ]

#   alarm_name          = "${var.alarm_type}-${var.resource_type}-${var.function_name}"
#   comparison_operator = var.alarm_operator
#   evaluation_periods  = var.evaluation_periods
#   datapoints_to_alarm = var.datapoints_to_alarm
#   metric_name         = var.metric_name
#   namespace           = var.alarm_namespace
#   period              = var.alarm_period
#   statistic           = var.alarm_statistic
#   threshold           = var.alarm_threshold
#   alarm_description   = ""

#   tags = {
#     "name" : "${var.alarm_type}-${var.resource_type}-${var.function_name}"

#   }
# }

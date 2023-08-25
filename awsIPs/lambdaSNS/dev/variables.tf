variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "playground"
}



variable "function_name" {
  default = "dynamoips"

}


variable "ipsdynamo" {
  default = "['52.94.4.0/24', '35.71.102.0/24']"

}


variable "dynamoSNS" {
  type    = string
  default = "arn:aws:sns:us-east-1:806199016981:AmazonIpSpaceChanged"

}



#############################
#var cloudwatch


variable "sns_name" {
  type    = string
  default = "cloudwatchii"
}

variable "alarm_operator" {
  type    = string
  default = "GreaterThanOrEqualToThreshold"
}

variable "metric_name" {
  type    = string
  default = "Invocations"
}

variable "alarm_namespace" {
  type    = string
  default = "AWS/Lambda"
}

variable "alarm_type" {
  type    = string
  default = "execution"
}

variable "resource_type" {
  type    = string
  default = "lambda"
}

variable "evaluation_periods" {
  type    = string
  default = "1"
}

variable "datapoints_to_alarm" {
  type    = string
  default = "1"
}

variable "alarm_period" {
  type    = string
  default = "900"
}

variable "alarm_statistic" {
  type    = string
  default = "Sum"
}

variable "alarm_threshold" {
  type    = string
  default = "1"
}

variable "alarm_names" {
  type = string
  default = "lambda-Alarmeeee"
}


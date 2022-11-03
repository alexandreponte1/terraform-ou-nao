variable "aws_region" {
  description = "AWS region for all resources."
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "default"
}

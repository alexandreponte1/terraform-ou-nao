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

variable "env_name" {
  default     = "role-s3-example"
  description = "Terraform environment name"
}
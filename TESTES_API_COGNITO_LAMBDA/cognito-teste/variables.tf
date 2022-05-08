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

variable "service_name" {
  type        = string
  description = ""
  default     = "decolou"
}

variable "service_domain" {
  type        = string
  description = ""
  default     = "decolou"
}

variable "accountId" {
  type    = string
  default = "89768598585"
}

variable "env" {
  type    = string
  default = "dev"
}
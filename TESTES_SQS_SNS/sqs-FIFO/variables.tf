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
  default     = "meu-teste"
}

variable "service_domain" {
  type        = string
  description = ""
  default     = "meu-teste"
}

variable "accountId" {
  type    = string
  default = "484500046757"
}

variable "env" {
  type    = string
  default = "dev"
}
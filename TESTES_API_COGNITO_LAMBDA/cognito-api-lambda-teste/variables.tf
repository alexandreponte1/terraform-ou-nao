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
  default     = "voar"
}


variable "app_name" {
  type        = string
  description = ""
  default     = "casa"
}



variable "service_domain" {
  type        = string
  description = ""
  default     = "voar"
}

variable "accountId" {
  type    = string
  default = "419277227138"
}

variable "env" {
  type    = string
  default = "dev"
}

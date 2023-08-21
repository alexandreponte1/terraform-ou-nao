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
  default     = "jupiter"
}


variable "accountId" {
  type    = string
  default = "877563618566"
}


variable "function_name" {
  default = "layeredtest"

}
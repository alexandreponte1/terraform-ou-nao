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
  default = "jupiter1"

}




variable "ipsdynamo" {
  default = "['52.94.4.0/24', '35.71.102.0/24']"
  
}
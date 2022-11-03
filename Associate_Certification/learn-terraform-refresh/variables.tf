variable "region" {
  description = "AWS region in which to provision infrastructure"
  default     = "us-east-1"
}


variable "profile" {
  type = string
  default = "default"
  
}
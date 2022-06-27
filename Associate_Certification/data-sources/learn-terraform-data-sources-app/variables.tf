
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "default"
}

variable "instances_per_subnet" {
  description = "Number of EC2 instances in each private subnet"
  type        = number
  default     = 2
}

variable "instance_type" {
  description = "Type of EC2 instance to use"
  type        = string
  default     = "t2.micro"
}



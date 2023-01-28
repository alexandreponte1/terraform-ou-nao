
# ###
# ## variable "aws_region" {
# ##   type        = string
# ##   description = ""
# ##   default     = "us-east-1"
# ## }

# # to reference the variable
# # var.my-var

# # no caso acima

# # var.aws_region


# # terraform.tfvars (best pratice in separate file)

# # variable validation on terraform


# variable "my-var" {
#   type        = string
#   description = "my test var"
#   default     = "us-east-1"
#   validation{
#     condition = lenght(var.my-var) > 4
#      error_message = "The string mus"
#   }
# }

# # DA pra colococar um parametro SENSITIVE pra evistar que o terraform mostr a senha durante a execução.



# variable "my-var2" {
#   description = "my test var"
#   type        = string
#   default     = "hello"
#   sensitive   = true
# }


# # Base Types
# # tipos de variaveis

# #  - string
# #  - number
# #  - bool

# # Complex Types:
# # - list, set, map, object, tuple


# #STRING TYPE
# variable "my-var2" {
#   type        = string
#   default     = "hello"
# }

# #LIST TYPE
# variable "my-var2" {
#   type        = list(string)
#   default     = ["us-west-1a"] #aqui a lista
# }



# #LIST OF OBJECTS
# variable "docker_ports" {
#   type        = list(object({
#     internal = number
#     external = number
#     protocol = string

#   }))
#   default     = [
#     {
#     internal = 8300
#     external = 8300
#     protocol = "TCP"

#     }
#   ]
# }


# # terraform output - Output Values

# output "instance_ip"{
#   description = "VM's Private IP"
#   value       = aws_instance.my-vm.private_ip
# }

# # output aparece depois do terraform apply.
# Learn Terraform Functions

Learn what Terraform functions are and how to use them.

Follow along with the [Learn tutorial at HashiCorp Learn](https://learn.hashicorp.com/tutorials/terraform/functions?in=terraform/configuration-language).


ssh-keygen -C "your_email@example.com" -f ssh_key

ssh ubuntu@$(terraform output -raw web_public_ip) -i ssh_key

ssh ubuntu@$(terraform output -raw web_public_ip) -i ssh_key
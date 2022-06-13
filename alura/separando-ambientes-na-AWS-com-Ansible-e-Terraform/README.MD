https://learn.hashicorp.com/tutorials/terraform/aws-build?in=terraform/aws-get-started



ansible-playbook playbook.yml -u ubuntu --private-key key.pem -i hosts.yml



ansible-playbook env/prod/playbook.yml -u ubuntu --private-key env/prod/IaC-Prod.pub -i infra/hosts.yml
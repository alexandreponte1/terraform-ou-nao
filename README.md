# Terraform-ou-não

Repositório dedicado ao meu aprendizado com terraform.








--------------------------------------------------------------------







# Comandos úteis.

- terraform destroy -target RESOURCE_TYPE.NAME -target RESOURCE_TYPE2.NAME





#terraform init -backend=true -backend-config=backend.hcl
#terraform plan -out="tfplan.out"

#aws s3 ls
#terraform init
#terraform init -reconfigure
#terraform init
#terraform show

#The table must have a partition key named LockID with type of String. If not configured, state locking will be disabled.

#dynamodb config
#Table name = tfstate
#Partition key = LockID
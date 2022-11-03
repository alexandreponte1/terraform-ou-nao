# Learn Terraform Drift Management

This is a companion repository for the [Learn Terraform Drift Management tutorial](https://learn.hashicorp.com/tutorials/terraform/resource-drift) on HashiCorp Learn. Follow along to learn more about state management.



ssh-keygen -t rsa -C "your_email@example.com" -f ./key



 export SG_ID=$(aws ec2 create-security-group --group-name "sg_web" --description "allow 8080" --output text)


 echo $SG_ID


 aws ec2 authorize-security-group-ingress --group-name "sg_web" --protocol tcp --port 8080 --cidr 0.0.0.0/0

 aws ec2 modify-instance-attribute --instance-id $(terraform output -raw instance_id) --groups $SG_ID
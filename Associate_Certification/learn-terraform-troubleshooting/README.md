# Learn Terraform Troubleshooting

This is a companion repository for the [Learn Terraform Troubleshooting](https://learn.hashicorp.com/tutorials/terraform/troubleshooting-workflow) tutorial on HashiCorp Learn. Follow along to learn more about configuration language troubleshooting.



terraform output instance_public_ip
[
  "54.234.138.57",
  "18.206.157.238",
]


terraform output -json instance_public_ip
["54.234.138.57","18.206.157.238"]


For scripting and automation, use -json to produce the stable JSON format. You can parse the output using a JSON command-line parser such as jq:


curl $(terraform output -json instance_public_ip |jq -r '.[0]'):8080


terraform output instance_public_ip
[
  "54.234.138.57",
  "18.206.157.238",
]


terraform output -json instance_public_ip
["54.234.138.57","18.206.157.238"]


For scripting and automation, use -json to produce the stable JSON format. You can parse the output using a JSON command-line parser such as jq:


curl $(terraform output -json instance_public_ip |jq -r '.[0]'):8080


ec2_instance_public_ips = [
  "3.223.129.31",
  "3.238.144.235",
]


terraform output -json ec2_instance_public_ips |jq -r '.[0]'
3.223.129.31

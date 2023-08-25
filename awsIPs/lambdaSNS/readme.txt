jq -r '.prefixes[] | select(.region=="us-east-2") | select(.service=="DYNAMODB") | .ip_prefix' < ip-ranges.json
35.71.102.0/24
52.94.4.0/24

jq -r '.prefixes[] | select(.region=="us-east-1") | select(.service=="DYNAMODB") | .ip_prefix' < ip-ranges.json
3.218.180.0/22
52.119.232.0/21
35.71.68.0/22
52.119.224.0/21
52.94.0.0/22
3.218.180.0/25
3.218.180.128/25
3.218.181.0/25
3.218.181.128/25
3.218.182.0/25
3.218.182.128/25
3.218.183.0/25
3.218.183.128/25


jq -r '.prefixes[] | select(.region=="sa-east-1") | select(.service=="DYNAMODB") | .ip_prefix' < ip-ranges.json
52.94.7.0/24
35.71.106.0/24



jq -r '.prefixes[] | select(.region=="us-west-2") | select(.service=="DYNAMODB") | .ip_prefix' < ip-ranges.json

52.119.252.0/22
52.94.10.0/24
35.71.64.0/22
52.94.28.0/23
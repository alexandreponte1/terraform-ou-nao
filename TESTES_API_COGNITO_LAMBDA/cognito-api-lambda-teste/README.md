Com esse repositório estou criando:
API GATEWAY
LAMBDA
COGNITO


Para testes

Logar no console do cognito, criar um usuário, utilizar esse usuário para pegar o token JWT.

Converter jwt
https://www.convertonline.io/convert/query-string-to-json

pegar apenas a parte do id token.


utilizar esse token pra teste no  postman/insommnia

Utilizar este output para testes.


output "base_url" {
  value = aws_api_gateway_deployment.apideploy.invoke_url
}
cd clientes-api/
cat Dockerfile
docker build . -t producao:V1



aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 595438810944.dkr.ecr.us-east-1.amazonaws.com

595438810944.dkr.ecr.us-east-1.amazonaws.com/producao

docker tag f4d7eacb04dc 595438810944.dkr.ecr.us-east-1.amazonaws.com/producao:v1


docker push 595438810944.dkr.ecr.us-east-1.amazonaws.com/producao:v1




docker tag iddaimagem nomedorepo/producao:v1

docker push nomedorepo/producao:v1
cd clientes-api/
cat Dockerfile
docker build . -t producao:V1



aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 838463904376.dkr.ecr.us-east-1.amazonaws.com



docker tag f4d7eacb04dc 838463904376.dkr.ecr.us-east-1.amazonaws.com/producao:v1


docker push 838463904376.dkr.ecr.us-east-1.amazonaws.com/producao:v1






aws elasticbeanstalk update-environment --environment-name ambiante-de-producao --version-label ambiante-de-producao


aws elasticbeanstalk update-environment --environment-name ambinete-de-homolog --version-label ambinete-de-homolog


Criar o bucket no s3 para o backend

ex:
terraform {
  backend "s3" {
    bucket = "terraform-state-alexandre"
    key    = "Prod/terraform.tfstate"
    region = "us-east-1"
  }
}


cd clientes-api/
cat Dockerfile
docker build . -t producao:V1



aws ecr get-login-goku --region us-east-1 | docker login --username AWS --goku-stdin 615484935511.dkr.ecr.us-east-1.amazonaws.com

docker tag f4d7eacb04dc 615484935511.dkr.ecr.us-east-1.amazonaws.com/producao:v1








aws elasticbeanstalk update-environment --environment-name ambiante-de-producao --version-label ambiante-de-producao


aws elasticbeanstalk update-environment --environment-name ambinete-de-homolog --version-label ambinete-de-homolog



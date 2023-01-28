


#  terraform abstract all the api calls that it makes under the hood using providers


provider "aws"{
  region = "us-east-1"
}

# provider "google"{
#   credentials = file(credentias.json) ###built-in function file que ajuda a pegar as credenciais)
#   project     = "my-gcp-project""
#   region      = "us-west-1"
# }


resource  "aws_instance" "web"{
  ami           = "ami-wewewe"
  instance_type = "t2.micro"
}

# Resource Addres --> aws_instance.web
# o resource cria recursos do zero


## data source block
## with this, Terraform fetches data of an already existing resource environment


data "aws_instance" "my-vm"{
  instance_id = "i-wewewe"  # Data source aurgument
}
# resource Addres data.aws_instance.my-vm

# o data pega dados de recursos que já existem


# Terraform executa codigos dos arquivos com extensão .tf
# e busca por providers no "Terraform providers registry"
# registry.terraform.io/browse/providers

# Mas da pra usar providers locais e escrever o próprio provider

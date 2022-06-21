resource "aws_instance" "app_server" {
  ami           = "ami-09d56f8956ab235b3"
  instance_type = var.instancia
  key_name      = var.chave

  tags = {
    Name = "Primeira_ou_nao"
  }

  vpc_security_group_ids = [aws_security_group.acesso.id]
}


resource "aws_key_pair" "chaveSSH" {
  key_name   = var.chave
  public_key = file("${var.chave}.pub")
}
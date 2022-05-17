resource "aws_instance" "app_server" {
  ami           = "ami-09d56f8956ab235b3"
  instance_type = "t2.micro"
  user_data     = file("script.sh")
  key_name      = "iac-alura"

  tags = {
    Name = "Primeira_ou_nao"
  }

  vpc_security_group_ids = [aws_security_group.webapp.id]
}





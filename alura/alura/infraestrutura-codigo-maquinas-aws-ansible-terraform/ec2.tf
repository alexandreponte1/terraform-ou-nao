resource "aws_instance" "app_server" {
  ami           = "ami-09d56f8956ab235b3"
  instance_type = "t2.micro"
  # user_data = <<-EOF
  #               #!/bin/bash
  #               cd /home/ubuntu
  #               echo "<h1>Mensagem a ser mostrada</h1>" > index.html
  #               nohup busybox httpd -f -p 8080 &
  #               EOF
  #user_data     = file("script.sh")
  key_name = "iac-alura"
  #criar uma key no console da aws, descomentar a linha, e baixar a chave criada.

  tags = {
    Name = "terraform ANsible Python"
  }

  vpc_security_group_ids = [aws_security_group.webapp.id]
}
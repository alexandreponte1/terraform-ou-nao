sudo apt-get update
sudo apt install -y nginx
sudo su
sudo echo "<h1>Hello World from the other side, i am at $(hostname -f)</h1>" >  index.nginx-debian.html
sudo systemctl restart nginx
sudo systemctl status nginx
sudo nginx -t
# sudo amazon-linux-extras install nginx1 -y
# sudo systemctl restart nginx
# sudo systemctl status nginx
# sudo nginx -t

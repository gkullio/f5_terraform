#!/bin/bash
# nginx-install.tpl

# Update your system's package index
sudo apt-get update -y
sudo apt-get upgrade -y

# Install curl
sudo apt-get install curl -y

# Install PHP
sudo apt install --no-install-recommends -y php php-mysql php-fpm php-cli php-mbstring php-xml php-curl php-zip php-gd php-imagick php-redis php-pear php-dev

# Install NGINX
sudo apt-get install nginx -y

# Install unzip
sudo apt-get install unzip -y

# Enable and start the NGINX service
sudo systemctl enable nginx
sudo systemctl start nginx

# Create ssl directory in /etc/nginx and create self-signed cert / key for use with the sinlge page app.
sudo mkdir /etc/nginx/ssl/ /etc/nginx/ssl/certs /etc/nginx/ssl/private
sudo openssl req -subj '/CN=gage.com/O=gage/C=US' -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -keyout /etc/nginx/ssl/private/server.key -out /etc/nginx/ssl/certs/server.out
sudo chmod 644 /etc/nginx/ssl/private/server.key

# Backup the default nginx configuration file
sudo mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak

# Download the initial nginx application sites
mkdir ~/sites
sudo wget https://github.com/gkullio/tf_modules_test/archive/refs/tags/prod.zip -P ~/sites


# Unzip the file
sudo unzip ~/sites/prod.zip -d ~/sites
sudo tar -xvf ~/sites/tf_modules_test-prod/sites.tar -C /

# Create a symbolic link to the sites-enabled directory
sudo ln -s /etc/nginx/sites-available/*.conf /etc/nginx/sites-enabled/

# Restart the NGINX service
sudo systemctl restart nginx

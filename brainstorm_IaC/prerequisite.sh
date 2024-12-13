#!/bin/bash
apt -y update
apt install nginx -y
systemctl start nginx
apt install mysql-server -y
systemctl start mysql
apt install php-fpm php-mysql -y
apt install certbot python3-certbot-nginx -y
wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv wordpress brainstorm
mv brainstorm /var/www/html/
chown -R www-data:www-data /var/www/html/brainstorm
chmod -R 755 /var/www/html/brainstorm
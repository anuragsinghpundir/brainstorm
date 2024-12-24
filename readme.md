GTmetrix Report (A Grade, 96% Performance)

![GTmetrix Report (A Grade)](https://github.com/anuragsinghpundir/ci-cd_wordpress/blob/master/Screenshots/GTmetrix_Report.png?raw=true)

**`Prerequisites`**

1. Operating System: Ubuntu 20.04 or newer.
2. Nginx: Installed and running.
3. PHP: Version 8.3 with php-fpm installed.
4. MySQL: Database for WordPress.
5. Certbot: Installed for managing SSL certificates.
6. Domain Name: Pointing to your server's IP address.

**`IaC (Infrastructure as Code) for Provisioning of the Server on AWS`**

IaC Code present in the brainstorm_IaC folder in the repo.
![AWS_Server](https://github.com/anuragsinghpundir/ci-cd_wordpress/blob/master/Screenshots/provisioned%20server.png)

**`Wordpress Installation`**

**`Download WordPress:`**

* wget https://wordpress.org/latest.tar.gz
* tar -xvf latest.tar.gz
* sudo mv wordpress /var/www/html/wordpress
* sudo chown -R www-data:www-data /var/www/html/wordpress
* sudo chmod -R 755 /var/www/html/wordpress
* Configure the database for WordPress using MySQL
* MySql Commands: create database wordpress create user 'wordpress_user'@'localhost' identified by 'password_of_your_choice'; grant all privileges on brainstorm.* to 'wordpress_user'@'localhost'; flush privileges;
* Add database configuration to wp-config.php file

**`File Structure`**

* Root Directory: /var/www/html/wordpress
* Certificate: /etc/letsencrypt/live/anurag.myddns.me/fullchain.pem
* Key: /etc/letsencrypt/live/anurag.myddns.me/privkey.pem
* Nginx Configuration File: /etc/nginx/sites-available/wordpress
 ![nginx.conf](https://github.com/anuragsinghpundir/ci-cd_wordpress/blob/master/Screenshots/wordpress%20configuration%20nginx.png)

**`Key Features`**

Gzip Compression: Reduces response size for faster page load times.
HTTP/2: Enables faster communication between the server and the browser.
SSL Encryption: Provides secure connections with Let's Encrypt certificates.
Caching: 
* Implements try_files for better caching of static and dynamic content.
* Uses FastCGI caching (optional) to optimize PHP requests.
Security Headers:
* Protect against XSS, MIME-type sniffing, and clickjacking.
* Enforce a restrictive Content Security Policy.

**`Deployment Steps`**

Update Nginx Configuration:
* Save the above configuration to /etc/nginx/sites-available/wordpress

Enable the site:
sudo ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/

Check Configuration:
* sudo nginx -t

Reload Nginx:
* sudo systemctl reload nginx

Obtain SSL Certificates:
* sudo certbot --nginx -d anurag.myddns.me -d www.anurag.myddns.me

WEBSITE: https://anurag.myddns.me
![website](https://github.com/anuragsinghpundir/ci-cd_wordpress/blob/master/Screenshots/default%20page.png)
Default Page after Hosted on the server

**`Test the Configuration:`**

* Visit: https://anurag.myddns.me.
* Tool Used: GTmetrix to evaluate performance and security

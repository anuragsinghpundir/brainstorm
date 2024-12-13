GTmetrix Report (A Grade, 96% Performance)

![GTmetrix Report (A Grade)](https://github.com/anuragsinghpundir/brainstorm/blob/master/Screenshots_Brainstorm/GTmetrix_Report.png?raw=true)

**`Prerequisites`**
1. Operating System: Ubuntu 20.04 or newer.
2. Nginx: Installed and running.
3. PHP: Version 8.3 with php-fpm installed.
4. MySQL: Database for WordPress.
5. Certbot: Installed for managing SSL certificates.
6. Domain Name: Pointing to your server's IP address.

**`IaC (Infrastructure as Code) for Provisioning of the Server on AWS`**
IaC Code present in the brainstorm_IaC folder in the repo.
![AWS_Server](https://github.com/anuragsinghpundir/brainstorm/blob/master/Screenshots_Brainstorm/provisioned%20server.png)

**`File Structure`**
Root Directory: /var/www/html/brainstorm
SSL Certificates:
Certificate: /etc/letsencrypt/live/anurag.myddns.me/fullchain.pem
Key: /etc/letsencrypt/live/anurag.myddns.me/privkey.pem
Nginx Configuration File: /etc/nginx/sites-available/brainstorm.com ![nginx.conf](https://github.com/anuragsinghpundir/brainstorm/blob/master/Screenshots_Brainstorm/brainstorm.com%20configuration%20nginx.png)

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
* Save the above configuration to /etc/nginx/sites-available/brainstorm.com

Enable the site:
sudo ln -s /etc/nginx/sites-available/brainstorm.com /etc/nginx/sites-enabled/

Check Configuration:
* sudo nginx -t

Reload Nginx:
* sudo systemctl reload nginx

Obtain SSL Certificates:
* sudo certbot --nginx -d anurag.myddns.me -d www.anurag.myddns.me

Test the Configuration:
Visit: https://anurag.myddns.me.
Tool Used: GTmetrix to evaluate performance and security

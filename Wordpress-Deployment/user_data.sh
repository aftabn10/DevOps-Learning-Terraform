#!/bin/bash

# update OS
yum update -y

# install web server, start and enable it
yum install -y httpd
systemctl start httpd
systemctl enable httpd

# install php and php extension
yum install -y php php-mysqlnd

# install mysql, start and enable it
yum install -y mariadb
systemctl start mariadb
systemctl enable mariadb

# remove default apache test page
rm -f /var/www/html/index.html

# install wordpress
wget https://wordpress.org/latest.tar.gz
tar -xf latest.tar.gz

# move the files to /var/www/html
cp -r wordpress/* /var/www/html/

# configure permissions (directories, files)
chown -R apache:apache /var/www/html 
find /var/www/html -type d -exec chmod 755 {} \; 
find /var/www/html -type f -exec chmod 644 {} \; 

# restart apache
systemctl restart httpd
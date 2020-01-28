#!/bin/sh
apt -y install php-mbstring
service php7.3-fpm start
chown -R mysql:mysql var/lib/mysql
service mysql start
mysql -u root -e "CREATE DATABASE mydb"
mysql -u root -e "CREATE DATABASE phpmyadmin"
mysql -u root -e "CREATE USER 'Maro'@'localhost' IDENTIFIED BY 'root';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'Maro'@'localhost';"
mysql -u root mydb < mydb.sql
mysql -u root phpmyadmin < phpmyadmin.sql
mkdir /var/www/html/phpmyadmin/tmp
chmod 777 /var/www/html/phpmyadmin/tmp
mdkir /var/www/html/maro
chmod 777 /var/www/html/maro
service nginx start

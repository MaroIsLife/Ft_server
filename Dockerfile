FROM debian:buster

RUN apt-get update
RUN apt-get install -y wget unzip vim lsb-release gnupg
RUN apt-get install -y nginx
RUN apt-get install -y php7.3-fpm
RUN apt-get install -y php-mysql
RUN wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && mv wordpress/* /var/www/html
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-all-languages.zip && unzip phpMyAdmin-5.0.1-all-languages.zip && mv phpMyAdmin-5.0.1-all-languages /var/www/html/phpmyadmin

RUN apt update
RUN apt upgrade -y 

#Download and Install SQL
COPY srcs/mysql-apt-config_0.8.13-1_all.deb /
RUN echo "mysql-apt-config mysql-apt-config/select-server select mysql-5.7" | debconf-set-selections
RUN wget http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb
RUN DEBIAN_FRONTEND=noninteractive dpkg -i mysql-apt-config_0.8.13-1_all.deb
RUN apt -y update
RUN echo "mysql-server-5.7 mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server-5.7 mysql-server/root_password_again password root" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server
#chown, -R mysql:mysql var/lib/mysql
RUN echo "daemon off;" >> etc/nginx/nginx.conf
COPY srcs/default /etc/nginx/sites-available
COPY srcs/wp-config.php /var/www/html
COPY srcs/script.sh /
COPY srcs/mydb.sql /
COPY srcs/config.inc.php /var/www/html/phpmyadmin
COPY srcs/phpmyadmin.sql /
COPY srcs/server.crt /etc/ssl/private
COPY srcs/server.csr /etc/ssl/private
COPY srcs/server.key /etc/ssl/private
CMD ./script.sh

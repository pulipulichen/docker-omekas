FROM php:7.4-apache

RUN apt update

# Omeka S preparation

# https://stackoverflow.com/a/52574007/6645399
RUN docker-php-ext-install pdo pdo_mysql

RUN apt-get install -y imagemagick

# Enable Apache2's RewriteEngine
RUN a2enmod rewrite

# Create database and user
# Script from: https://stackoverflow.com/a/44343801/6645399
#COPY ./build/createDatabaseAndUser.sh /tmp/
#RUN chmod +x /tmp/createDatabaseAndUser.sh
#RUN /tmp/createDatabaseAndUser.sh omekas omekas password

# =================

# Copy Omeka S files
COPY ./build/omeka-s /var/www/html/

# =================

#RUN chmod 777 -R /var/www/html/omeka-s/files

#RUN apt-get install -y mariadb-server

# Automating mysql_secure_installation
# Script from https://gist.github.com/Mins/4602864
#RUN apt-get -y install expect
#COPY ./build/mysql_secure_installation.sh /tmp/
#RUN bash /tmp/mysql_secure_installation.sh

# Create database and user
# Script from: https://stackoverflow.com/a/44343801/6645399
#COPY ./build/mysql_create_db_user.sh /tmp/
#RUN chmod +x /tmp/mysql_create_db_user.sh
#RUN /tmp/mysql_create_db_user.sh --host=localhost --database=moodle --user=moodle

#RUN apt-get install -y php*-mysql
#COPY ./build/usr/local/etc/php/php.ini-development /usr/local/etc/php/
#COPY ./build/usr/local/etc/php/php.ini-production /usr/local/etc/php/

#COPY ./build/phpinfo.php /var/www/html/

#RUN docker-php-ext-install pdo pdo_mysql

# To run MariaDB and Apache
#RUN mkdir -p /opt
#COPY ./build/start-service.sh /opt/
#UN chmod +x /opt/start-service.sh

#CMD ["/opt/start-service.sh"]
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
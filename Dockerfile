FROM php:7.4-apache

# Prepare install packages
RUN apt update

# Enable PHP extension to connect MySQL.
# Ref: https://stackoverflow.com/a/52574007/6645399
RUN docker-php-ext-install pdo pdo_mysql

# Generating thumbnails in Omeka S.
# Ref: https://github.com/omeka/omeka-s#generating-thumbnails
RUN apt-get install -y imagemagick

# Enable Apache2's RewriteEngine.
# Ref: https://stackoverflow.com/a/5758551/6645399
RUN a2enmod rewrite

# Copy Omeka S files.
# Download from https://omeka.org/s/download/
COPY ./build/omeka-s /var/www/html/

# Setup database connection.
COPY ./build/database.ini /var/www/html/config/

# Prevent log storage.
# Ref: https://serverfault.com/a/711172/432158
RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
    ln -sf /proc/self/fd/1 /var/log/apache2/error.log

# Clear unused packages
# Ref: https://gist.github.com/marvell/7c812736565928e602c4?permalink_comment_id=3913930#gistcomment-3913930
RUN apt-get clean -y

# Start Apache in foreground.
# Ref: https://morioh.com/p/0b40718134e6
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
FROM docker.io/php:8.1-apache-bullseye
RUN apt update && apt install wget
WORKDIR /var/www/html
VOLUME /var/www/html/data
# Download and extract
RUN wget -4 https://snappymail.eu/repository/latest.tar.gz
RUN tar -xzf latest.tar.gz
# Set permissions
RUN find /var/www/html/snappymail -type d -exec chmod 755 {} \;
RUN find /var/www/html/snappymail -type f -exec chmod 644 {} \;
RUN chown -R www-data:www-data /var/www/html/snappymail
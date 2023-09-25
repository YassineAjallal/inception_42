FROM debian:bookworm

RUN apt update

# install php fpm
RUN apt install -y php8.2 php8.2-fpm php8.2-mysql

#install adminer
RUN apt install -y adminer

# move adminer folder to /var/www/html
RUN mv /usr/share/adminer /var/www/html

# give the right permission to /var/www/html/adminer
RUN chmod -R 755 /var/www/html/adminer

# change the php-fpm config to listen on all network avialable on port 8080
RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:8080|g" /etc/php/8.2/fpm/pool.d/www.conf

EXPOSE 8080

CMD ["php-fpm8.2", "-F"]
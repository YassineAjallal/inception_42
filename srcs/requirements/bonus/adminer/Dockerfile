FROM debian:bookworm

RUN apt update && apt install -y

RUN apt install -y php8.2 php8.2-fpm php8.2-mysql mariadb-client

RUN apt install -y adminer

RUN mv /usr/share/adminer /var/www/html

RUN	chown -R root:root /var/www/html/adminer

RUN chmod -R 755 /var/www/html/adminer
RUN chown -R www-data:www-data /var/www/html/adminer

RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:8080|g" /etc/php/8.2/fpm/pool.d/www.conf

EXPOSE 8080

CMD ["php-fpm8.2", "-F"]
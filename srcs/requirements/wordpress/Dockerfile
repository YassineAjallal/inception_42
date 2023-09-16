FROM debian:latest

RUN apt update && apt install -y wget

RUN apt install -y php8.2 php8.2-fpm php8.2-mysql mariadb-client

RUN wget https://wordpress.org/latest.tar.gz -P /var/www

RUN cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz

RUN		chown -R root:root /var/www/wordpress

RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/setup.sh /setup.sh

EXPOSE 9000

ENTRYPOINT [ "sh", "setup.sh" ]
CMD ["php-fpm8.2", "-F", "-R"]


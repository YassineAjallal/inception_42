FROM debian:bookworm

# install mariadb
RUN apt-get -y update && apt-get -y install mariadb-server

# change the mariadb config to listen on all network avialable
RUN sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh  /script.sh

EXPOSE 3306

ENTRYPOINT ["sh", "script.sh"]

CMD ["mysqld_safe"]
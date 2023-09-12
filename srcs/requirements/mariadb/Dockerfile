FROM debian:buster

RUN apt -y update && apt -y install mariadb-server

RUN mkdir -p /run/mysqld; chmod 777 /run/mysqld

RUN sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

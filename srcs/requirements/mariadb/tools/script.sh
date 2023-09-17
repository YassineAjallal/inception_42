#!bin/sh

service mariadb start;
sleep 10;
mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;" -u root
mysql -e "CREATE USER IF NOT EXISTS 'yajallal'@'localhost' IDENTIFIED BY 'yajallal';" -u root
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'yajallal'@'%' IDENTIFIED BY 'yajallal';" -u root
mysql -e "FLUSH PRIVILEGES;";
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'yajallal';"
mysqladmin -u root -pyajallal shutdown;
exec "$@"

# service mariadb start;
# sleep 10;
# mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;" -u root
# mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" -u root
# mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" -u root
# mysql -e "FLUSH PRIVILEGES;"; -u root
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
# mysqladmin -u root -pyajallal shutdown;
# exec "$@"
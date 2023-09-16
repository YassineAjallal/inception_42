#!bin/sh

service mysql start;
sleep 10;
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;";
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysqladmin -u root -pyajallal shutdown;
exec "$@"
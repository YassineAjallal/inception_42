#!bin/sh

service mariadb start;
sleep 5;
mysql -u -p root "USE information_schema; SELECT COUNT(*) as table_count FROM TABLES WHERE TABLE_SCHEMA = 'wordpress';" | grep 0 |
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;" -u root
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" -u root
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" -u root
mysql -e "FLUSH PRIVILEGES;";
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown;
exec "$@"
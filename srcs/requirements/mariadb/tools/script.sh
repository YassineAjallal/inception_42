#!bin/sh

service mariadb start; # start mariadb server
sleep 5; # waiting for mariadb to start properly
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;" -u root # create new database
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" -u root # create new user
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" -u root # give all privileges on wordpress database  to new user  
mysql -e "FLUSH PRIVILEGES;"; # save changes
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" # changes the root password
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown; # shutdown the server
exec "$@"
#!bin/sh

service mysql start;
sleep 4;
mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;";
mysql -e "CREATE USER IF NOT EXISTS 'yassine'@'localhost' IDENTIFIED BY 'yajallal';";
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO yajallal@'%' IDENTIFIED BY 'yajallal';";
mysql -e "FLUSH PRIVILEGES;";
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'yajallal';";
mysqladmin -u root -pyajallal shutdown;
exec mysqld
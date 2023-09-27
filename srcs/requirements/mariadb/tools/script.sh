#!bin/sh

# service mariadb start; # start mariadb server
# # sleep 5; # waiting for mariadb to start properly
# # mysql -u root --skip-password;

# mysql -u root --skip-password <<EOF
# CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
# CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
# GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
# FLUSH PRIVILEGES;
# ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
# EOF
# # mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" # create new database
# # mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" # create new user
# # mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" # give all privileges on wordpress database  to new user  
# # mysql -u root -p$MYSQL_ROOT_PASSWORD -e  "FLUSH PRIVILEGES;"; # save changes
# # # mysql -e -u root "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" # changes the root password
# mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown; # shutdown the server

if [ -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
	echo "Database ${MYSQL_DATABASE} exists.";
else
	    cat << EOF > /tmp/wp.sql
USE mysql;
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
EOF
       	mariadbd --user=mysql --bootstrap < /tmp/wp.sql;
        rm -f /tmp/wp.sql;
fi
exec "$@"

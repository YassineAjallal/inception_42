#!bin/sh

cd /var/www/html/wordpress;
if ! wp --allow-root core is-installed; then
	wp core download	--allow-root; # download core files
	wp config create	--allow-root --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb:3306; # create the config file of wordpress that contain database info
	wp core install		--allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWD} --admin_email=${WP_ADMIN_EMAIL}; # create new wordpress website
fi

wp user list --allow-root --path=/var/www/html/wordpress --field=user_login | grep -q ${WP_ADMIN}
if [ $? != 0 ]; then
	wp user create --allow-root ${WP_ADMIN} ${WP_ADMIN_EMAIL} --role=administrator --user_pass=${WP_ADMIN_PASSWD} --path=/var/www/html/wordpress; # create first user (administrator)
fi
wp user list --allow-root --path=/var/www/html/wordpress --field=user_login | grep -q ${WP_USER}
if [ $? != 0 ]; then
	wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --role=editor --user_pass=${WP_USER_PASSWD} --path=/var/www/html/wordpress; # create second user (editor)
fi

exec "$@"
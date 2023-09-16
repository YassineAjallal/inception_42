wp config create	--allow-root \
					--dbname=${SQL_DATABASE} \
					--dbuser=${SQL_USER} \
					--dbpass=${SQL_PASSWORD} \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'
wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWD} --admin_email=${WP_ADMIN_EMAIL}

echo "Creating users..."
wp user create ${WP_ADMIN} ${WP_ADMIN_EMAIL} --role=administrator --user_pass=${WP_ADMIN_PASSWD} --path=/var/www/html/wordpress --allow-root

wp user create ${WP_USER} yusufisawii@gmail.com --role=editor --user_pass=${WP_PASSWD} --path=/var/www/html/wordpress --allow-root 


exec "$@"
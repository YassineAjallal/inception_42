FROM debian:latest

# install nginx and openssl
RUN apt -y update && apt -y install nginx && apt -y install openssl

# give the right permission to /etc/ssl/private
RUN chmod 700 /etc/ssl/private

# create a self-signed key and certificate with OpenSSL and configure it
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/yajallal.key -out /etc/ssl/certs/yajallal.crt -subj /C=MA/ST=ChtoukaAitBaha/L=Bouigra/O=1337/OU=42Network/CN=yajallal

# create Diffie-Hellman group
RUN openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

# create our website folders
RUN mkdir -p /var/www/html/wordpress
RUN mkdir -p /var/www/html/adminer
RUN mkdir -p /var/www/html/tempo

EXPOSE 443

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]


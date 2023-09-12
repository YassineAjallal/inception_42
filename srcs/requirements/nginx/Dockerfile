FROM debian:buster

RUN apt -y update && apt -y install nginx && apt -y install openssl

RUN chmod 700 /etc/ssl/private
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/yajallal.key -out /etc/ssl/certs/yajallal.crt -subj /C=MA/ST=ChtoukaAitBaha/L=Bouigra/O=1337/OU=42Network/CN=yajallal
RUN openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
EXPOSE 443

COPY ./tools /home/
COPY ./conf /etc/nginx

CMD ["nginx", "-g", "daemon off;"]


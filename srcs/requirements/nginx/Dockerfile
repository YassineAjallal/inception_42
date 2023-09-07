FROM debian:latest

RUN apt -y update && apt -y install nginx && apt -y install openssl

EXPOSE 443

COPY ./tools /home/
COPY ./conf /etc/nginx

CMD ["nginx", "-g", "daemon off;"]


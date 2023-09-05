FROM debian:latest

RUN apt -y update && apt -y install nginx && apt -y install openssl

EXPOSE 80
COPY ./tools/nike_website 

CMD ["nginx", "-g", "daemon off;"]


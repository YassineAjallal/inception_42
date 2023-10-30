# Inception 42
Use docker-compose to set up an environment composed of different services (nginx, wordpress, mariadb, adminer, static website)
# Services
  1) [mariadb](https://github.com/YassineAjallal/inception_42/tree/master/srcs/requirements/mariadb)
  2) [nginx](https://github.com/YassineAjallal/inception_42/tree/master/srcs/requirements/nginx)
  3) [wordpress](https://github.com/YassineAjallal/inception_42/tree/master/srcs/requirements/wordpress)
  4) [adminer](https://github.com/YassineAjallal/inception_42/tree/master/srcs/requirements/bonus/adminer)
  5) [static website](https://github.com/YassineAjallal/inception_42/tree/master/srcs/requirements/bonus/tempo)
# Prerequisites
Make sure you have installed all of the following prerequisites on your machine:
- Docker
- Docker compose
# Set up your environment
### Edit /etc/hosts to add your server name
``` 127.0.0.1 yajallal.42.fr adminer.42.fr tempo.42.fr ```
### Run Services
```bash
~ git clone https://github.com/YassineAjallal/inception_42.git
~ cd inception_42
~ make
```
open your browser and tap :
- yajallal.42.fr -> wordpress website
- adminer.42.fr -> adminer website
- tempo.42.fr -> static website
# Resources
- [What is Virtualization](https://dev.to/alubhorta/what-is-virtualization-bare-metal-vs-virtual-machines-vs-containers-99a)
- [What is Docker](https://dev.to/alubhorta/what-is-docker-docker-made-easy-part-1-him)
- [How do Docker Images work?](https://dev.to/alubhorta/how-do-docker-images-work-docker-made-easy-part-2-1b41)
- [The Docker Container Lifecycle](https://dev.to/alubhorta/the-docker-container-lifecycle-docker-made-easy-3-554o)
- [How do Docker Volumes work?](https://dev.to/alubhorta/how-do-docker-volumes-enable-persistence-for-containers-docker-made-easy-4-5fgc)
- [Why is Networking important in Docker? ](https://dev.to/alubhorta/why-is-networking-important-in-docker-networking-in-docker-1-3mef)
- [Basics of Networking ](https://dev.to/alubhorta/basics-of-networking-networking-in-docker-2-2jl9)
- [Docker Network Drivers Overview](https://dev.to/alubhorta/docker-network-drivers-overview-30c)
- [The Bridge Network Driver ](https://dev.to/alubhorta/the-bridge-network-driver-networking-in-docker-6-1ahf)
- [What is Docker Compose? ](https://dev.to/alubhorta/what-is-docker-compose-with-demo-bfp)
- [How to Configure PHP-FPM with NGINX](https://www.digitalocean.com/community/tutorials/php-fpm-nginx)
- [How To Create a Self-Signed SSL Certificate for Nginx](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-20-04-1)

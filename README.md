# thought-docker

This repo depicts an example to run java application in one container and the static files in another container.
Both containers are under reverse proxy nginx to server the application.

Container as Static file server :

This is an nginx container loaded with static files

Container as application server:
This is a tomcat container to serve the java application

Container as proxy server:

This is a nginx-proxy server which will redirects the traffic to application server and static file server respectively.


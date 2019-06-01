This folder consists the Dockerfiles to build the docker images for reverse-proxy and static file servers respectively.

there are 2 folders in this directory /app and /web.

/app is for reverse-proxy and it uses nginx. I have mentioned in nginx.conf to reverse-proxy the traffic between the containers one with .war and other with static files.

/web is for the static file server and it uses nginx. I have pushed the static files to the container while building so that nginx can serve  the files.

The Dockerfiles in these folders are responsible to create the docker images for the java application.

The Java application can run on docker by running the following command in the same directory.

$ docker-compose up

But for this scenario I'm using terraform and docker swarm and the terraform scripts can be found here.

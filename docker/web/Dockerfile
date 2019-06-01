FROM nginx:latest
 
COPY static /usr/share/nginx/html/static/
RUN rm /etc/nginx/conf.d/default.conf 
COPY default.conf /etc/nginx/conf.d/

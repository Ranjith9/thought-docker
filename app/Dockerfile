FROM nginx
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/
COPY nginx.crt /etc/nginx/modules/
COPY nginx.key /etc/nginx/modules/

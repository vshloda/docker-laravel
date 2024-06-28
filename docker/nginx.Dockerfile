FROM nginx:stable-alpine

ADD ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/html

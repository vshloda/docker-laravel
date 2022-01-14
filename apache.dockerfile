FROM httpd:alpine

ADD ./apache/httpd-vhosts.conf /usr/local/apache2/conf/extra/httpd-vhosts.conf

RUN sed -i 's,#Include conf/extra/httpd-vhosts.conf,Include conf/extra/httpd-vhosts.conf,g' /usr/local/apache2/conf/httpd.conf

RUN mkdir -p /var/www/html

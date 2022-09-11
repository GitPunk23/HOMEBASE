FROM httpd:latest
WORKDIR /usr/local/apache2/htdocs/
COPY ./website/ /usr/local/apache2/htdocs/

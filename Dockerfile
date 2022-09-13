FROM httpd:latest
COPY ./website /usr/local/apache2/htdocs
RUN mkdir -p RUN  mkdir -p /run/apache2/ && \
    chown www-data:www-data /run/apache2/ && \
    chmod 777 /run/apache2/

EXPOSE 80 443

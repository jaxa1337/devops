FROM nginx

RUN mkdir -p /var/www/test/public_html/
WORKDIR /var/wwwtest/public_html/

COPY --chown=root:www-data ./app/index.html .
RUN chown www-data:www-data -R /var/www/test
VOLUME /var/www/test
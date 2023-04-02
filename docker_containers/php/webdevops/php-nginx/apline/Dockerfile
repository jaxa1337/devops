FROM webdevops/php-nginx:7.2-alpine
RUN mkdir -p /tmp/logs
RUN touch /tmp/logs/cron.log
RUN chown application:application -R /tmp/logs

COPY ./provision/cron/crontab /etc/crontabs/application

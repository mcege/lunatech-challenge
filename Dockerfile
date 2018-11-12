FROM nginx:stable-alpine

RUN rm -f /etc/nginx/conf.d/default.conf

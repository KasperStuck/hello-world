#!/bin/sh
export SERVER_IP=$(hostname -i | awk '{print $1}')
envsubst '${HOSTNAME} ${SERVER_IP}' < /usr/share/nginx/html/index.html.template > /usr/share/nginx/html/index.html
exec nginx -g 'daemon off;'

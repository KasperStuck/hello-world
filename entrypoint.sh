#!/bin/sh
IP=$(hostname -i | awk '{print $1}')
sed -e "s|{{HOSTNAME}}|$(hostname)|" -e "s|{{IP}}|${IP}|" \
  /usr/share/nginx/html/index.html.template > /usr/share/nginx/html/index.html
exec nginx -g 'daemon off;'

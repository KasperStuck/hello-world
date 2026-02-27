FROM docker/nginx-alpine
COPY index.html /usr/share/nginx/html/index.html.template
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 3000
CMD ["/bin/sh", "-c", "IP=$(hostname -i | awk '{print $1}') && sed -e \"s|{{HOSTNAME}}|$HOSTNAME|\" -e \"s|{{IP}}|$IP|\" /usr/share/nginx/html/index.html.template > /usr/share/nginx/html/index.html && nginx -g 'daemon off;'"]

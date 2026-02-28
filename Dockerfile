FROM nginx:alpine
RUN rm -f /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
COPY index.html /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 3000

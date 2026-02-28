FROM nginxinc/nginx-unprivileged:alpine

# Switch to root to pre-build nginx cache directories.
# Docker Swarm ignores cap_add/cap_drop, so the entrypoint's runtime chown()
# fails without CAP_CHOWN. By pre-owning at build time, the chown is a no-op.
USER root
RUN mkdir -p /var/cache/nginx/client_temp \
             /var/cache/nginx/proxy_temp \
             /var/cache/nginx/fastcgi_temp \
             /var/cache/nginx/uwsgi_temp \
             /var/cache/nginx/scgi_temp && \
    chown -R 101:101 /var/cache/nginx /var/log/nginx
USER 101

RUN rm -f /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 3000

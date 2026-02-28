FROM nginxinc/nginx-unprivileged:alpine

# Pre-build nginx cache directories with correct ownership (UID 101 = nginx).
# Docker Swarm ignores cap_add/cap_drop, so the entrypoint's runtime chown()
# fails without CAP_CHOWN. By pre-owning at build time (as root), the
# entrypoint's chown becomes a no-op.
RUN mkdir -p /var/cache/nginx/client_temp \
             /var/cache/nginx/proxy_temp \
             /var/cache/nginx/fastcgi_temp \
             /var/cache/nginx/uwsgi_temp \
             /var/cache/nginx/scgi_temp && \
    chown -R 101:101 /var/cache/nginx /var/log/nginx

RUN rm -f /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 3000

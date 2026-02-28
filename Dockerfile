FROM nginxinc/nginx-unprivileged:alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 3000
ENTRYPOINT []
CMD ["nginx", "-g", "daemon off;"]

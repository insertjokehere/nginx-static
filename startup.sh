#!/bin/bash

if [ -z STATIC_URL ]; then
    STATIC_URL="/"
fi

if [ -z STATIC_ROOT ]; then
    STATIC_ROOT="/var/www"
fi

cat <<EOF > /etc/nginx/nginx.conf
worker_processes 1;

events {
    worker_connections  1024;
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    tcp_nopush     on;
    keepalive_timeout  65;
    gzip  on;
    server_tokens off;

    server {
        listen 80;

        server_name localhost;

        access_log off;

        location ${STATIC_URL} {
            alias ${STATIC_ROOT};
        }
    }
}
EOF

nginx -g "daemon off;"

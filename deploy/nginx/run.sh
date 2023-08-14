#!/bin/bash

echo "#----------------------------------------#"
echo "#                                        #"
echo "#       Run docker nginx container       #"
echo "#                                        #"
echo "#----------------------------------------#"

nginx_path="C:\Users\seo\projects\archive\deploy\nginx"

sites_available_path="$nginx_path/sites-available"
sites_enabled_path="$nginx_path/sites-enabled"
ssl_path="$nginx_path/ssl"
logs_path="$nginx_path/logs"
html_path="$nginx_path/html"

echo "Nginx path: $nginx_path, continue? [y/n]"
nginx_path=$(cd "$nginx_path" && pwd)
read -r continue
if [ "$continue" != "y" ]; then
    echo "Aborted"
    exit 1
fi

cd "$nginx_path" || echo "Nginx path not found" && exit 1
mkdir -p "$sites_available_path"
mkdir -p "$sites_enabled_path"
mkdir -p "$ssl_path"
mkdir -p "$logs_path"
mkdir -p "$html_path"

docker run -dit \
    --name nginx \
    -p 80:80 \
    -p 443:443 \
    -v "$sites_available_path":/etc/nginx/sites-available \
    -v "$sites_enabled_path":/etc/nginx/sites-enabled \
    -v "$ssl_path":/etc/nginx/ssl \
    -v "$logs_path":/var/log/nginx \
    -v "$html_path":/usr/share/nginx/html \
    nginx:latest
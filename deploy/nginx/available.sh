#!/bin/bash

# enable webserver by creating config files in sites-available and linking them in sites-enabled
app_name=$1
if [ -z "$app_name" ]; then
    echo "Usage: ./available.sh <app_name>"
    exit 1
fi

# Ask for server name
echo "Enter domain:"
read -r domain

# Ask for port
echo "Enter port:"
read -r port

# Ask for ssl
echo "Enable ssl? [y/n]"
read -r enable_ssl

# Ask for request limiting
echo "Enable request limiting? [y/n]"
read -r enable_limit_req

# Confirm before continuing
echo "App name: $app_name, domain: $domain, port: $port, enable ssl: $enable_ssl, continue? [y/n]"
read -r continue
if [ "$continue" != "y" ]; then
    echo "Aborted"
    exit 1
fi

set_limit_req()
{
cat <<EOF
  limit_req_zone \$binary_remote_addr zone=limitreqsbyaddr:20m rate=10r/s;
  limit_req_status 429;
EOF
}

create_template()
{
cat <<EOF
  upstream $app_name {
      server localhost:$port;
  }

   $(if [ "$enable_limit_req" == "y" ]; then set_limit_req; fi)

  server {
      root /var/www/html;
      index index.html index.htm index.nginx-debian.html;

      listen 80;
      listen [::]:80;

      server_name $domain;

      location / {
          $(if [ "$enable_limit_req" == "y" ]; then echo "limit_req zone=limitreqsbyaddr;"; fi)
          proxy_pass http://$app_name;

          proxy_set_header Host \$host;
          proxy_set_header X-Real-IP \$remote_addr;
          proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto \$scheme;

          client_max_body_size 0;
          add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload";

          access_log /var/log/nginx/$app_name.access.log;
          error_log /var/log/nginx/$app_name.error.log;
      }
  }
EOF
}

# Create config file in sites-available
echo "Creating config file in sites-available"
create_template > "./sites-available/$app_name.conf"

# Create symlink in sites-enabled
ln -s "./sites-available/$app_name.conf" "./sites-enabled/$app_name.conf"

## Create ssl certificate
#docker exec -it nginx certbot --nginx -d "$domain"
#docker exec -it nginx service nginx reload
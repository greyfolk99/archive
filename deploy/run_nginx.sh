#!/bin/bash

docker run -dit \
    --name nginx \
    -p 80:80 \
    -p 443:443 \
    -v nginx:/etc/nginx \
    nginx:latest


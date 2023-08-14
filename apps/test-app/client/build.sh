#!/bin/bash

server_static_resources_path=$1

# build client
npm run build

# copy build to server resources
cp -r build/* "$server_static_resources_path"



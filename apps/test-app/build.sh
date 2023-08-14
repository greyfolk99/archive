#!/bin/bash

# clean and mkdir deploy
project_folder_name=$(basename "$(pwd)")
deploy_path=../../deploy/apps/"$project_folder_name"
server_static_resources_path=server/build/resources/main/static

# get string of absolute path of deploy_path
deploy_path=$(cd "$deploy_path" && pwd -P)
server_static_resources_path=$(cd "$server_static_resources_path" && pwd -P)

# exit if paths are empty
if [ -z "$deploy_path" ] || [ -z "$server_static_resources_path" ]; then
    echo "Invalid paths"
    exit 1
fi

# clean and mkdir deploy and clean server static resources
rm -rf "$deploy_path"
rm -rf "$server_static_resources_path/*"
mkdir -p "$deploy_path"

# build client and copy build to server resources
cd client || echo "client directory not found" && exit 1
./build.sh "$server_static_resources_path"

cd ../

# build server and copy build and resources to deploy
cd server || echo "server directory not found" && exit 1
./build.sh "$deploy_path"

cd ../

# copy docker-compose.yml to deploy
cp docker-compose.yml "$deploy_path"


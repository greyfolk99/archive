# My Archive

## Requirements
- docker
- docker-compose
- ... and can vary depending on apps

## Description
- contains basic settings for projects
- Easy to copy and paste to new projects
- Easy to deploy

## Development
- **./develop/apps/{app_name}/build.sh** - to build and prepare for deployment
- built files will be copied to '**deploy/apps/{app_name}/temp**' directory

## Deployment
- contains environment variables and settings such as docker-compose.yml, Dockerfile, etc.
- **./deploy/apps/{app_name}/temp** - contains built files from development (if any)
- **./deploy/apps/{app_name}/run.sh** - select command type to run (up, down, rmi, build, etc.)
- **./deploy/run.sh**  - select app and start run.sh in app folder

### Apps

1. my-nginx  
./available.sh - to register website by creating config file in ./sites-available  
NOTE: default proxy-pass will be set to host.docker.internal:port

## Template (WIP)
- deploy and develop folders have 'templates'
- can run with 'create_template.sh' in deploy or develop folder
#!/bin/bash

deploy_path=$1

# build app
./gradlew clean bootJar

# copy jar and resources to deploy
cp build/libs/*.jar "$deploy_path"
cp -r src/main/resources/* "$deploy_path"

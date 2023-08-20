#!/usr/bin/env bash

# choose app in ./apps and can loop
select app in $(ls ./apps); do
    # check if app is not empty
    if [ -z "$app" ]; then
        echo "Invalid app"
        exit 1
    fi

    cd ./apps/"$app" || exit 1
    # choose 1: build, 2: up, 3: down, 4: rmi, 0: exit
    while true;
    do
        ./run.sh
        # if abnormal exit, exit
        if [ $? -ne 0 ]; then
            exit 1
        fi
    done
done

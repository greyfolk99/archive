#!/bin/bash

echo ""
echo "Choose command for $(basename "$(pwd)"):"
select command_type in "up" "down" "rmi" "build" "exit"
do
  case $command_type in
    "up")
      source ./export.sh
      if [ -z "$APP_NAME" ] || [ -z "$APP_VERSION" ]; then
          echo "No .env file found."
          exit 1
      fi
      docker compose -p "$APP_NAME" --env-file .env up -d --force-recreate
      echo ""
      exit 0
      ;;
    "down")
      docker compose -p "$APP_NAME" down
      rm -f ./.env
      echo ""
      exit 0
      ;;
    "rmi")
      echo "Select version:"
      select VERSION in $(docker images -a | grep "$APP_NAME" | awk '{print $2}')
      do
          echo "Selected version: $VERSION"
          break
      done
      rm -f ./.env
      docker rmi "$APP_NAME":"$VERSION"
      echo ""
      exit 0
      ;;
    "build")
      project_folder_name=$(basename "$(pwd)")
      cd ../../../develop/apps/"$project_folder_name" || exit
      ./build.sh
      cd ../../../deploy/apps/"$project_folder_name" || exit
      echo "Build complete."
      echo ""
      exit 0
      ;;
    "exit")
      exit 1
      ;;
    *)
      echo "Invalid option"
      ;;
  esac
done
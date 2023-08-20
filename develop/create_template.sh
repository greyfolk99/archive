#!/bin/bash

# choose template
echo "Choose template:"
cd ./templates || exit
select template in $( ls -d * );
do
  template=${template%*/} # remove trailing slash
  template=${template##*/} # remove path
  echo "Selected template: $template"
  break
done
cd ../

while true; do
  # input project name
  echo "Enter project name:"
  read -r project_name
  # check if project exists
  if [ -d "./apps/$project_name" ]; then
      echo "Project already exists. Try again."
      continue
  fi
  # check if project name is valid as directory name
  # if project name contains anything other than a-z, A-Z, 0-9, _ , - and length is not in range 1-30
  if [[ "$project_name" =~ [^a-zA-Z0-9_-] ]] || [ ${#project_name} -lt 1 ] || [ ${#project_name} -gt 30 ]; then
      echo "Project name is invalid. Try again."
      continue
  fi

  # confirm
  echo "Project name: $project_name"
  echo "Is this correct? [Y/n]"
  read -r answer
  if [ "$answer" != "${answer#[Yy]}" ]; then
      echo "Continuing..."
  else
      echo "Then try other name."
      continue
  fi
  break
done

# first get ignored files
cd ./templates/"$template" || exit
ignored_files=$(find . -type f  | git check-ignore --stdin)

# copy files not ignored
for f in $(find . -type f -a -not -path './.git/*'); do
  # manually ignore files that are obvious and take too long to check
  if [[ $f == *"node_modules"* ]]; then
     continue
  fi
  if [[ $ignored_files == *"$f"* ]]; then
    # if file is .env, then just copy it
    if [[ $f == *".env"* ]]; then
      echo "Copying $f"
      mkdir -p "../../apps/$project_name/$(dirname "$f")"
      cp "$f" "../../apps/$project_name/$f"
      continue
    fi
    continue
  fi
  # copy file
  echo "Copying $f"
  mkdir -p "../../apps/$project_name/$(dirname "$f")"
  cp "$f" "../../apps/$project_name/$f"
done
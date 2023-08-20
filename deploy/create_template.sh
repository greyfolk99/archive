#!/bin/bash

# select template
echo "Select template:"
select template in $(ls -d templates/*); do
    if [ -n "$template" ]; then
        echo "Selected template: $template"
        break
    fi
done

#
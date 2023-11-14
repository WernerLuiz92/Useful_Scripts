#!/bin/bash

regex='(.*?[^\d]+)(\d+)(.*?[^\d]+)'
original_string=$(xclip -o)

if [[ $original_string =~ $regex ]]; then
    group_2=$((10#${BASH_REMATCH[2]} + 1))
    new_string="${BASH_REMATCH[1]}$group_2${BASH_REMATCH[3]}"
    echo "$new_string"
else
    echo "$original_string"
fi
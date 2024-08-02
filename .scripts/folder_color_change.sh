#!/bin/bash

# Define the color you want to apply to all folders
COLOR="black"

# Get the list of all directories in the current directory
FOLDERS=$(find . -type d)

for FOLDER in $FOLDERS; do
    # Change the folder color using the folder-color tool
    folder-color --set $COLOR "$FOLDER"
done

echo "All folder colors changed to $COLOR."

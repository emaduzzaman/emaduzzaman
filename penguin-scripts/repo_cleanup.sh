#!/bin/bash

# repo_cleanup.sh
# Safely delete a cloned GitHub repository after finishing tasks

# Default repo folder (change if needed)
REPO_FOLDER="emaduzzaman"

# Check if folder exists
if [ ! -d "$REPO_FOLDER" ]; then
    echo "Folder '$REPO_FOLDER' not found. Nothing to delete."
    exit 1
fi

echo "You are about to delete the folder '$REPO_FOLDER'."
echo "This will permanently remove all contents inside it."
read -p "Are you sure you want to continue? (y/N): " CONFIRM

# Convert input to lowercase
CONFIRM=${CONFIRM,,}

if [[ "$CONFIRM" == "y" || "$CONFIRM" == "yes" ]]; then
    rm -rf "$REPO_FOLDER"
    echo "Folder '$REPO_FOLDER' has been deleted."
else
    echo "Operation cancelled. Folder not deleted."
fi

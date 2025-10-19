#!/bin/bash

echo "==============================="
echo "      AUTO GIT PUSH SCRIPT      "
echo "==============================="

# Ask the user for environment
read -p "Select environment: [m] Mac / [w] Windows: " env_choice

# Set repo path based on input
if [[ "$env_choice" == "m" ]]; then
    REPO_PATH="$HOME/Workplace/emaduzzaman"  # <-- Mac path
elif [[ "$env_choice" == "w" ]]; then
    REPO_PATH="/mnt/d/emaduzzaman"           # <-- Windows WSL path
else
    echo "❌ Invalid option. Exiting."
    exit 1
fi

# Check if the repo path exists
if [[ ! -d "$REPO_PATH" ]]; then
    echo "❌ Repo path not found: $REPO_PATH"
    exit 1
fi

cd "$REPO_PATH" || exit

# Git operations
echo "📂 Current repo path: $REPO_PATH"
echo "Adding all changes..."
git add .

# Ask for commit message
read -p "Enter commit message: " COMMIT_MSG

# Commit with entered message
git commit -m "$COMMIT_MSG" 2>/dev/null || echo "Nothing to commit, working tree clean"

echo "Pushing to GitHub..."
git push origin main

echo "✅ Done!"

#!/bin/bash
# 🔁 Simple Git Auto Push Script for emaduzzaman repo

# Define your repo path
REPO_PATH=/Users/kaziemaduzzamangelani/Workplace/emaduzzaman

# Go to your repo
cd "$REPO_PATH" || { echo "❌ Repo path not found!"; exit 1; }

# Pull latest changes
echo "🔄 Pulling latest changes from GitHub..."
git pull origin main

# Ask for commit message
read -p "💬 Enter commit message: " commit_msg

# Add all changes
git add .

# Commit with message
git commit -m "$commit_msg"

# Push to remote
echo "🚀 Pushing changes to GitHub..."
git push origin main

echo "✅ Done! Your repo is up to date."


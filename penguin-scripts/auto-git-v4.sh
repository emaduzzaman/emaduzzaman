#!/bin/bash
# ==========================================
#   AUTO GIT SYNC SCRIPT (Mac + Windows)
#   Author: Kazi Emaduzzaman Gelani
#   Version: v3 (Cross-Platform)
# ==========================================

echo "==============================="
echo "     🔁 AUTO GIT PUSH TOOL      "
echo "==============================="

# Ask environment
read -p "Select environment: [m] Mac / [w] Windows: " env_choice

# Set repo path based on environment
if [[ "$env_choice" == "m" ]]; then
    REPO_PATH="$HOME/Workplace/emaduzzaman"          # Mac path
elif [[ "$env_choice" == "w" ]]; then
    REPO_PATH="/mnt/d/emaduzzaman"                   # Windows WSL path
else
    echo "❌ Invalid option. Please choose 'm' or 'w'."
    exit 1
fi

# Check repo directory
if [[ ! -d "$REPO_PATH" ]]; then
    echo "❌ Repo path not found: $REPO_PATH"
    exit 1
fi

cd "$REPO_PATH" || exit

echo "📂 Working in: $REPO_PATH"
echo

# Always pull latest updates before pushing
echo "⬇️  Pulling latest updates from GitHub..."
git pull origin main

echo
echo "🧾 Checking for changes..."
git status

# Ask for commit message
echo
read -p "📝 Enter commit message: " commit_msg

# Stage, commit, and push
echo
echo "🔧 Adding all changes..."
git add .

echo "💬 Committing with message: '$commit_msg'"
git commit -m "$commit_msg" 2>/dev/null || echo "✅ Nothing new to commit."

echo "⬆️  Pushing to GitHub..."
git push origin main

echo
echo "✅ All done! Repo synced successfully 🚀"


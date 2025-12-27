#!/bin/bash

echo "=============================="
echo " macOS Browser Cache Cleaner "
echo "=============================="
echo ""

# Function to calculate directory size
dir_size() {
  du -sh "$1" 2>/dev/null | awk '{print $1}'
}

# Safari
echo "🧹 Clearing Safari cache..."
SAFARI_CACHE="$HOME/Library/Caches/com.apple.Safari"
echo "Before: $(dir_size "$SAFARI_CACHE")"
rm -rf "$SAFARI_CACHE"
echo "After: Cleared"
echo ""

# Google Chrome
echo "🧹 Clearing Google Chrome cache..."
CHROME_CACHE="$HOME/Library/Caches/Google/Chrome"
echo "Before: $(dir_size "$CHROME_CACHE")"
rm -rf "$CHROME_CACHE"
echo "After: Cleared"
echo ""

# Firefox
echo "🧹 Clearing Firefox cache..."
FIREFOX_CACHE="$HOME/Library/Caches/Firefox"
echo "Before: $(dir_size "$FIREFOX_CACHE")"
rm -rf "$FIREFOX_CACHE"
echo "After: Cleared"
echo ""

# Microsoft Edge
echo "🧹 Clearing Microsoft Edge cache..."
EDGE_CACHE="$HOME/Library/Caches/Microsoft Edge"
echo "Before: $(dir_size "$EDGE_CACHE")"
rm -rf "$EDGE_CACHE"
echo "After: Cleared"
echo ""

# Brave
echo "🧹 Clearing Brave cache..."
BRAVE_CACHE="$HOME/Library/Caches/BraveSoftware"
echo "Before: $(dir_size "$BRAVE_CACHE")"
rm -rf "$BRAVE_CACHE"
echo "After: Cleared"
echo ""

echo "✅ Browser cache cleanup completed!"


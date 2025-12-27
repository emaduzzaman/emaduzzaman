#!/bin/bash

echo "=============================="
echo " Linux Browser Cache Cleaner "
echo "=============================="
echo ""

# Function to calculate directory size
dir_size() {
  du -sh "$1" 2>/dev/null | awk '{print $1}'
}

# Google Chrome
echo "🧹 Clearing Google Chrome cache..."
CHROME_CACHE="$HOME/.cache/google-chrome"
echo "Before: $(dir_size "$CHROME_CACHE")"
rm -rf "$CHROME_CACHE"
echo "After: Cleared"
echo ""

# Chromium
echo "🧹 Clearing Chromium cache..."
CHROMIUM_CACHE="$HOME/.cache/chromium"
echo "Before: $(dir_size "$CHROMIUM_CACHE")"
rm -rf "$CHROMIUM_CACHE"
echo "After: Cleared"
echo ""

# Firefox
echo "🧹 Clearing Firefox cache..."
FIREFOX_CACHE="$HOME/.cache/mozilla"
echo "Before: $(dir_size "$FIREFOX_CACHE")"
rm -rf "$FIREFOX_CACHE"
echo "After: Cleared"
echo ""

# Microsoft Edge
echo "🧹 Clearing Microsoft Edge cache..."
EDGE_CACHE="$HOME/.cache/microsoft-edge"
echo "Before: $(dir_size "$EDGE_CACHE")"
rm -rf "$EDGE_CACHE"
echo "After: Cleared"
echo ""

# Brave
echo "🧹 Clearing Brave cache..."
BRAVE_CACHE="$HOME/.cache/BraveSoftware"
echo "Before: $(dir_size "$BRAVE_CACHE")"
rm -rf "$BRAVE_CACHE"
echo "After: Cleared"
echo ""

echo "✅ Browser cache cleanup completed!"

#!/bin/bash

echo "🔹 macOS System Data Cleanup Started..."
echo "-------------------------------------"

# Measure free space before cleanup (in GB)
before=$(df -H / | tail -1 | awk '{print $4}')
echo "💾 Free space before cleanup: $before"

# 1. Clear User Cache
echo "🧹 Clearing user cache..."
rm -rf ~/Library/Caches/*

# 2. Clear System Cache (requires sudo)
echo "🧹 Clearing system cache..."
sudo rm -rf /Library/Caches/*

# 3. Clear Xcode Derived Data
if [ -d "$HOME/Library/Developer/Xcode/DerivedData" ]; then
    echo "🧹 Clearing Xcode DerivedData..."
    rm -rf ~/Library/Developer/Xcode/DerivedData/*
else
    echo "ℹ️ Xcode DerivedData not found."
fi

# 4. Clear Xcode Archives
if [ -d "$HOME/Library/Developer/Xcode/Archives" ]; then
    echo "🧹 Clearing old Xcode Archives..."
    rm -rf ~/Library/Developer/Xcode/Archives/*
fi

# 5. Homebrew Cleanup
if command -v brew >/dev/null 2>&1; then
    echo "🧹 Cleaning Homebrew..."
    brew cleanup -s
else
    echo "ℹ️ Homebrew not installed."
fi

# 6. Empty Trash
echo "🗑️ Emptying Trash..."
rm -rf ~/.Trash/*

# Measure free space after cleanup (in GB)
after=$(df -H / | tail -1 | awk '{print $4}')

# Calculate difference
echo "-------------------------------------"
echo "💾 Free space after cleanup: $after"

# Convert human-readable sizes to comparable GB (simplified)
before_gb=$(echo $before | sed 's/G//')
after_gb=$(echo $after | sed 's/G//')
freed=$(echo "$after_gb - $before_gb" | bc)

echo "✅ Approximate space freed: ${freed} GB"
echo "🔁 Please restart your Mac for best results."


#!/bin/bash
echo "===== User Installed Applications ====="

echo -e "\n--- APT (manual installs) ---"
apt-mark showmanual | wc -l | xargs echo "Count:"
apt-mark showmanual | while read pkg; do
  size=$(dpkg-query -W -f='${Installed-Size}' $pkg 2>/dev/null)
  if [ -n "$size" ]; then
    echo "$pkg - $((size/1024)) MB"
  fi
done | sort -h -k2

echo -e "\n--- Snap ---"
snap list --all

echo -e "\n--- Flatpak ---"
flatpak list --columns=application,size

echo -e "\n--- Pip (Python user packages) ---"
pip3 list --user

echo -e "\n--- NPM (Node.js global packages) ---"
npm -g list --depth=0


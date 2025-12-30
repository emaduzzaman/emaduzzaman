#!/bin/bash
# -----------------------------------------------------------------
# Complete BIND9 Cleanup Script
# Removes all bind9 packages, configs, logs, and cache.
# Use only if you're switching permanently to another DNS (like Unbound).
# -----------------------------------------------------------------

echo "⚠️  Starting BIND9 cleanup — this will completely remove BIND9 and its data."

# Stop and disable the service
sudo systemctl stop bind9 2>/dev/null
sudo systemctl disable bind9 2>/dev/null

# Purge all BIND-related packages
sudo apt-get purge -y bind9 bind9-utils bind9-host bind9-dnsutils dnsutils

# Remove configuration, cache, and zone files
sudo rm -rf /etc/bind
sudo rm -rf /var/cache/bind
sudo rm -rf /var/lib/bind
sudo rm -rf /var/log/bind
sudo rm -rf /run/named

# Remove any stray files in systemd configs
sudo find /etc/systemd/system -type f -name "*bind9*" -delete 2>/dev/null
sudo systemctl daemon-reload

# Clean up leftover dependencies and packages
sudo apt-get autoremove -y
sudo apt-get autoclean -y

# Confirm removal
echo
echo "✅ BIND9 and related files have been removed!"
echo "💡 Tip: You can check with 'dpkg -l | grep bind' — it should show nothing."
echo
echo "If you're using Unbound now, ensure it's running:"
echo "  sudo systemctl enable --now unbound"
echo


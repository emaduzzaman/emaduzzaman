#!/bin/bash
# ==============================================================
# delete_user.sh
# --------------------------------------------------------------
# A reusable cleanup script to completely remove a user and all
# related files, crontabs, sudo privileges, and leftover data
# from a Linux system.
#
# Usage:
#   chmod +x delete_user.sh
#   ./delete_user.sh <username>
#
# This script performs:
#   1. User existence check
#   2. Full user deletion (home dir, mail spool)
#   3. Cleanup of system files (/etc/passwd, /etc/shadow, etc.)
#   4. Removal of crontabs and scheduled jobs
#   5. Cleanup of sudo privileges
#   6. Deletion of all user-owned files system-wide
#   7. Removal of leftover systemd services
#
# NOTE:
#   - Must be run as root or with sudo privileges
#   - Be very careful! This script permanently deletes files.
# ==============================================================

USER="$1"  # Get the username passed as an argument

# Check if the username was provided
if [[ -z "$USER" ]]; then
    echo "Usage: $0 <username>"
    exit 1
fi

echo ">>> Starting cleanup for user: $USER"

# --------------------------------------------------------------
# 1. Check if the user exists in the system
# --------------------------------------------------------------
if id "$USER" &>/dev/null; then
    echo "[INFO] User $USER exists. Removing with userdel..."
    sudo userdel -r "$USER" && echo "[OK] User account and home directory removed."
else
    echo "[INFO] User $USER does not exist. Skipping userdel."
fi

# --------------------------------------------------------------
# 2. Remove entries from key system account files
#    (ensures all traces of the user are gone)
# --------------------------------------------------------------
for FILE in /etc/passwd /etc/shadow /etc/group /etc/gshadow; do
    if grep -q "^$USER:" "$FILE"; then
        sudo sed -i "/^$USER:/d" "$FILE"
        echo "[OK] Removed $USER entry from $FILE"
    else
        echo "[INFO] No entry for $USER in $FILE"
    fi
done

# --------------------------------------------------------------
# 3. Remove user crontabs (scheduled tasks)
# --------------------------------------------------------------
if sudo crontab -l -u "$USER" &>/dev/null; then
    sudo crontab -r -u "$USER"
    echo "[OK] Crontab for $USER removed."
else
    echo "[INFO] No crontab found for $USER"
fi

# Also remove any remaining crontab files from spool directory
sudo rm -rf /var/spool/cron/crontabs/"$USER" 2>/dev/null && echo "[OK] Removed /var/spool/cron/crontabs/$USER" || echo "[INFO] No cron spool for $USER"

# --------------------------------------------------------------
# 4. Remove any 'at' jobs (delayed tasks) owned by the user
# --------------------------------------------------------------
sudo find /var/spool/at -type f -user "$USER" -delete 2>/dev/null
echo "[OK] Removed at jobs for $USER (if any)"

# --------------------------------------------------------------
# 5. Remove any sudo privileges (from sudoers files)
# --------------------------------------------------------------
# Remove direct entry in /etc/sudoers
if sudo grep -q "$USER" /etc/sudoers; then
    sudo sed -i "/$USER/d" /etc/sudoers
    echo "[OK] Removed $USER from /etc/sudoers"
else
    echo "[INFO] No sudoers entry for $USER in /etc/sudoers"
fi

# Remove from all individual sudoers.d configuration files
for FILE in /etc/sudoers.d/*; do
    if sudo grep -q "$USER" "$FILE" 2>/dev/null; then
        sudo sed -i "/$USER/d" "$FILE"
        echo "[OK] Removed $USER from $FILE"
    fi
done

# --------------------------------------------------------------
# 6. Find and delete all remaining files owned by the user
# --------------------------------------------------------------
echo "[INFO] Searching for files owned by $USER..."
sudo find / -user "$USER" -exec rm -rf {} + 2>/dev/null
echo "[OK] Deleted all files owned by $USER"

# --------------------------------------------------------------
# 7. Remove any leftover systemd service files for the user
# --------------------------------------------------------------
if [[ -f "/etc/systemd/system/$USER.service" ]]; then
    sudo systemctl disable --now "$USER.service" &>/dev/null
    sudo rm -f "/etc/systemd/system/$USER.service"
    echo "[OK] Removed systemd service for $USER"
else
    echo "[INFO] No systemd service for $USER"
fi

# --------------------------------------------------------------
# Finished cleanup
# --------------------------------------------------------------
echo ">>> Cleanup completed for user: $USER"

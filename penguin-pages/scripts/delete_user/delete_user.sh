#!/bin/bash

# Script to completely remove all traces of a user from the system

USER="$1"

if [[ -z "$USER" ]]; then
    echo "Usage: $0 <username>"
    exit 1
fi

echo ">>> Starting cleanup for user: $USER"

# 1. Check if user exists
if id "$USER" &>/dev/null; then
    echo "[INFO] User $USER exists. Removing with userdel..."
    sudo userdel -r "$USER" && echo "[OK] User account and home directory removed."
else
    echo "[INFO] User $USER does not exist. Skipping userdel."
fi

# 2. Remove entries from system files
for FILE in /etc/passwd /etc/shadow /etc/group /etc/gshadow; do
    if grep -q "^$USER:" "$FILE"; then
        sudo sed -i "/^$USER:/d" "$FILE"
        echo "[OK] Removed $USER entry from $FILE"
    else
        echo "[INFO] No entry for $USER in $FILE"
    fi
done

# 3. Remove crontabs
if sudo crontab -l -u "$USER" &>/dev/null; then
    sudo crontab -r -u "$USER"
    echo "[OK] Crontab for $USER removed."
else
    echo "[INFO] No crontab found for $USER"
fi

sudo rm -rf /var/spool/cron/crontabs/"$USER" 2>/dev/null && echo "[OK] Removed /var/spool/cron/crontabs/$USER" || echo "[INFO] No cron spool for $USER"

# 4. Remove at jobs
sudo find /var/spool/at -type f -user "$USER" -delete 2>/dev/null
echo "[OK] Removed at jobs for $USER (if any)"

# 5. Remove sudoers entries
if sudo grep -q "$USER" /etc/sudoers; then
    sudo sed -i "/$USER/d" /etc/sudoers
    echo "[OK] Removed $USER from /etc/sudoers"
else
    echo "[INFO] No sudoers entry for $USER in /etc/sudoers"
fi

for FILE in /etc/sudoers.d/*; do
    if sudo grep -q "$USER" "$FILE" 2>/dev/null; then
        sudo sed -i "/$USER/d" "$FILE"
        echo "[OK] Removed $USER from $FILE"
    fi
done

# 6. Delete all files owned by the user anywhere
echo "[INFO] Searching for files owned by $USER..."
sudo find / -user "$USER" -exec rm -rf {} + 2>/dev/null
echo "[OK] Deleted all files owned by $USER"

# 7. Remove leftover systemd services
if [[ -f "/etc/systemd/system/$USER.service" ]]; then
    sudo systemctl disable --now "$USER.service" &>/dev/null
    sudo rm -f "/etc/systemd/system/$USER.service"
    echo "[OK] Removed systemd service for $USER"
else
    echo "[INFO] No systemd service for $USER"
fi

echo ">>> Cleanup completed for user: $USER"


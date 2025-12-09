#!/bin/bash
# -------------------------------
# Clean XFCE + xrdp installation
# Restore Ubuntu Server to minimal state
# -------------------------------

# Stop xrdp service
sudo systemctl stop xrdp
sudo systemctl disable xrdp

# Remove xrdp completely
sudo apt purge -y xrdp
sudo apt autoremove -y
sudo apt autoclean

# Remove XFCE desktop and related packages
sudo apt purge -y xfce4 xfce4-goodies xorg x11-xserver-utils dbus-x11
sudo apt autoremove -y
sudo apt autoclean

# Remove user session configs
rm -f ~/.xsession
rm -f ~/.Xauthority

# Restore original startwm.sh (if exists)
if [ -f /etc/xrdp/startwm.sh ]; then
    sudo mv /etc/xrdp/startwm.sh /etc/xrdp/startwm.sh.bak
fi

# Close RDP port (3389) if ufw is enabled
if sudo ufw status | grep -q "Status: active"; then
    sudo ufw deny 3389/tcp
fi

# Reload firewall
sudo ufw reload

# Remove any leftover XFCE configs in /etc
sudo rm -rf /etc/xdg/xfce4
sudo rm -rf /etc/X11/Xsession.d/*xfce*

# Done
echo "✅ XFCE, xrdp removed and port 3389 blocked. Your system is back to minimal Ubuntu Server state."

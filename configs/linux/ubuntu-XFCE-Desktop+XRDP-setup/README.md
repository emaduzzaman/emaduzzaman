# Ubuntu Server 24.04 - XFCE Desktop + XRDP Setup

A simple guide to install XFCE desktop environment on Ubuntu Server 24.04 and enable remote desktop access via RDP.

## What This Does

- Installs lightweight XFCE desktop on Ubuntu Server
- Configures XRDP for remote desktop connection
- Allows to connect using any RDP client
## Requirements

- Ubuntu Server 24.04 LTS
- SSH access to your server
- RDP client on your local machine

## Installation Steps

### 1. Update System

```bash
sudo apt update && sudo apt upgrade -y
```

### 2. Install XFCE Desktop

```bash
sudo apt install xfce4 xfce4-goodies dbus-x11 xorg x11-xserver-utils -y
```

### 3. Install XRDP

```bash
sudo apt install xrdp xorgxrdp -y
sudo systemctl enable xrdp
```

### 4. Configure XRDP for XFCE

Backup and edit the startwm.sh file:

```bash
sudo cp /etc/xrdp/startwm.sh /etc/xrdp/startwm.sh.bak
sudo nano /etc/xrdp/startwm.sh
```

Replace the entire content with:

```bash
#!/bin/sh
# XRDP session start script for XFCE

if [ -r /etc/profile ]; then
    . /etc/profile
fi
if [ -r ~/.profile ]; then
    . ~/.profile
fi

export XDG_SESSION_TYPE=x11
export DISPLAY=:10
export XAUTHORITY=$HOME/.Xauthority
unset DBUS_SESSION_BUS_ADDRESS
unset XDG_RUNTIME_DIR

startxfce4
```

Save and exit (Ctrl+O, Enter, Ctrl+X).

Make it executable:

```bash
sudo chmod +x /etc/xrdp/startwm.sh
```

### 5. Fix Permissions

```bash
touch ~/.Xauthority
sudo chown $USER:$USER ~/.Xauthority
```

### 6. Restart XRDP

```bash
sudo systemctl daemon-reload
sudo systemctl restart xrdp
```

### 7. Allow Firewall (if enabled)

```bash
sudo ufw allow 3389/tcp
sudo ufw reload
```

### 8. Reboot

```bash
sudo reboot
```

## Connect via RDP

1. Open your RDP client
2. Enter your server IP address
3. Use port 3389 (default)
4. Login with your Ubuntu username and password

## Troubleshooting

**Black screen after connecting?**
- Make sure you're not logging in as root
- Check that startwm.sh has the correct content
- Restart xrdp: `sudo systemctl restart xrdp`

**Connection refused?**
- Check if xrdp is running: `sudo systemctl status xrdp`
- Verify firewall allows port 3389

**Session disconnects immediately?**
- Ensure dbus-x11 is installed
- Check ~/.Xauthority ownership

## Notes

- Use a regular user account, not root
- XFCE is lightweight and works well for remote access
- Default RDP port is 3389
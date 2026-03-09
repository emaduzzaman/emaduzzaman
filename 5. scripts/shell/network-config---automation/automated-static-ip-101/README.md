# Automated Static IP 101

Interactive bash script to configure static IP addresses using Netplan on Ubuntu/Linux systems.

---

## Script

| Script | Description |
|--------|-------------|
| `automated-static-ip.sh` | Interactive tool to convert DHCP to static IP configuration |

---

## Usage

```bash
# Make executable
chmod +x automated-static-ip.sh

# Run the script
sudo bash automated-static-ip.sh
```

---

## Features

| Feature | Description |
|---------|-------------|
| Auto-Detection | Detects interface, current IP, gateway, MAC, and MTU automatically |
| Interactive Prompts | Asks for static IP, gateway, DNS with smart defaults |
| Auto-Backup | Creates timestamped backup before making changes |
| Cloud-Init Disable | Prevents cloud-init from overwriting your config on reboot |
| Validation | Runs `netplan generate` to check for errors before applying |
| Auto-Restore | Restores backup automatically if validation fails |
| Verification | Shows `networkctl status` after applying changes |

---

## What It Does

```
Step 1 → Detects current network configuration
Step 2 → Prompts for new static IP, gateway, DNS
Step 3 → Shows summary and asks for confirmation
Step 4 → Disables cloud-init network management
Step 5 → Backs up existing netplan config
Step 6 → Creates new netplan configuration
Step 7 → Validates with `netplan generate`
Step 8 → Applies with `netplan apply`
Step 9 → Verifies and displays results
```

---

## 💻 Example Session

```
════════════════════════════════════════════════════════════════
Ubuntu Static IP Configuration Script
════════════════════════════════════════════════════════════════

ℹ Detecting network interface...
✓ Detected Interface: ens3
✓ Current IP: 192.168.95.215/24
✓ Current Gateway: 192.168.95.1
✓ MAC Address: fa:16:3e:36:cb:9f
✓ MTU: 8942

════════════════════════════════════════════════════════════════
Enter Network Configuration
════════════════════════════════════════════════════════════════

Enter the static IP address with CIDR notation
Example: 192.168.95.215/24
Static IP [192.168.95.215/24]: 192.168.95.100/24

Enter the gateway address
Example: 192.168.95.1
Gateway [192.168.95.1]: 

Enter DNS server(s) - separate multiple with comma
Example: 8.8.8.8 or 8.8.8.8,8.8.4.4
DNS Server [8.8.8.8]: 8.8.8.8,1.1.1.1
```

---

## 🔧 Requirements

- **OS:** Ubuntu 18.04+ / Debian 10+
- **Privileges:** Root (sudo)
- **Network Manager:** Netplan

---

## ⚠️ Important Notes

| ⚠️ Warning | Details |
|-----------|---------|
| **SSH Users** | If connected via SSH, ensure new IP is correct or you may lose access |
| **Cloud Instances** | Script disables cloud-init network config automatically |
| **Backup Location** | Saved at `/etc/netplan/*.backup.YYYYMMDD_HHMMSS` |

---

## Restore Original Configuration

If something goes wrong:

```bash
# List backups
ls -la /etc/netplan/*.backup.*

# Restore (replace with your backup filename)
sudo cp /etc/netplan/50-cloud-init.yaml.backup.20241230_120000 /etc/netplan/50-cloud-init.yaml
sudo netplan apply
```

---
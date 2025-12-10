## System Configuration Files

### File: `sysctl.conf`
**Location:** `/etc/sysctl.conf`  
**Purpose:** Enable IP forwarding for routing between networks  
**Action:** Append this line to the file

```bash
# Enable IPv4 packet forwarding (required for VPN gateway)
# This allows the server to route packets between VPN clients and private network
net.ipv4.ip_forward=1
```

**Apply changes:**
```bash
sudo sysctl -p
```

---

### File: `99-wireguard.conf`
**Location:** `/etc/sysctl.d/99-wireguard.conf`  
**Purpose:** WireGuard-specific sysctl settings (alternative location)  
**Action:** Create this file for modular configuration

```bash
# IPv4 forwarding (required for VPN routing)
net.ipv4.ip_forward = 1

# Optional: Increase buffer sizes for better performance
net.core.rmem_max = 2500000
net.core.wmem_max = 2500000

# Optional: Enable TCP Fast Open for better connection performance
net.ipv4.tcp_fastopen = 3
```

**Apply changes:**
```bash
sudo sysctl -p /etc/sysctl.d/99-wireguard.conf
```

---

### File: `wg-quick@.service`
**Location:** `/etc/systemd/system/wg-quick@.service.d/override.conf`  
**Purpose:** Systemd service override for custom behavior  
**Action:** Create directory and file if needed

```ini
[Unit]
# Description override
Description=WireGuard VPN Gateway via wg-quick(8) for %i

# Start after network is online
After=network-online.target

[Service]
# Restart policy
Restart=on-failure
RestartSec=30s

# Timeout settings
TimeoutStartSec=60s
TimeoutStopSec=30s

[Install]
# Enable for multi-user target
WantedBy=multi-user.target
```

**Apply changes:**
```bash
sudo systemctl daemon-reload
sudo systemctl restart wg-quick@wg0
```

---
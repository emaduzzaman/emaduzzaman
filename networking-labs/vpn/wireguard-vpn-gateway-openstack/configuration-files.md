# WireGuard VPN Configuration Files Reference
## All Configuration Files for Quick Deployment

---

## Table of Contents
1. [Server Configuration Files](#server-configuration-files)
2. [Client Configuration Files](#client-configuration-files)
3. [System Configuration Files](#system-configuration-files)
4. [Firewall Configuration Files](#firewall-configuration-files)
5. [Helper Scripts](#helper-scripts)

---

## 1. Server Configuration Files

### File: `wg0.conf`
**Location:** `/etc/wireguard/wg0.conf`  
**Purpose:** Main WireGuard server interface configuration  
**Permissions:** `chmod 600 /etc/wireguard/wg0.conf`

```ini
[Interface]
# Server VPN IP address in the tunnel network
Address = 10.0.0.1/24

# UDP port for WireGuard to listen on
ListenPort = 51820

# Server's private key (REPLACE WITH YOUR GENERATED KEY)
PrivateKey = YOUR_SERVER_PRIVATE_KEY_HERE

# Commands to run when the VPN tunnel comes up
PostUp = sysctl -w net.ipv4.ip_forward=1; iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -d 192.168.90.0/27 -o ens3 -j MASQUERADE; iptables -A FORWARD -i wg0 -o ens3 -d 192.168.90.0/27 -j ACCEPT; iptables -A FORWARD -i ens3 -o wg0 -s 192.168.90.0/27 -j ACCEPT

# Commands to run when the VPN tunnel goes down (cleanup)
PostDown = sysctl -w net.ipv4.ip_forward=0; iptables -t nat -D POSTROUTING -s 10.0.0.0/24 -d 192.168.90.0/27 -o ens3 -j MASQUERADE; iptables -D FORWARD -i wg0 -o ens3 -d 192.168.90.0/27 -j ACCEPT; iptables -D FORWARD -i ens3 -o wg0 -s 192.168.90.0/27 -j ACCEPT

# ========================================
# CLIENT PEER CONFIGURATIONS
# Add one [Peer] section for each client
# ========================================

# Peer for client-101 (Windows Desktop)
[Peer]
# Client's public key (REPLACE WITH CLIENT'S PUBLIC KEY)
PublicKey = CLIENT_101_PUBLIC_KEY_HERE
# IP address assigned to this client (must be unique)
AllowedIPs = 10.0.0.2/32

# Peer for client-102 (Linux Laptop)
[Peer]
# Client's public key (REPLACE WITH CLIENT'S PUBLIC KEY)
PublicKey = CLIENT_102_PUBLIC_KEY_HERE
# IP address assigned to this client (must be unique)
AllowedIPs = 10.0.0.3/32

# Peer for client-103 (MacOS)
[Peer]
# Client's public key (REPLACE WITH CLIENT'S PUBLIC KEY)
PublicKey = CLIENT_103_PUBLIC_KEY_HERE
# IP address assigned to this client (must be unique)
AllowedIPs = 10.0.0.4/32

# Add more [Peer] sections as needed for additional clients
# Each client must have a unique IP in the 10.0.0.0/24 range
# Available IPs: 10.0.0.2 through 10.0.0.254
```

---

### File: `wg0-production.conf`
**Location:** `/etc/wireguard/wg0.conf` (production version)  
**Purpose:** Production configuration with actual keys from your deployment  
**Permissions:** `chmod 600 /etc/wireguard/wg0.conf`

```ini
[Interface]
Address = 10.0.0.1/24
ListenPort = 51820

# Your actual server private key
PrivateKey = 8LMQBoynitujxfoyXPfih/XqV+uQN297AHLs+MQ3rHc=

PostUp = sysctl -w net.ipv4.ip_forward=1; iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -d 192.168.90.0/27 -o ens3 -j MASQUERADE; iptables -A FORWARD -i wg0 -o ens3 -d 192.168.90.0/27 -j ACCEPT; iptables -A FORWARD -i ens3 -o wg0 -s 192.168.90.0/27 -j ACCEPT

PostDown = sysctl -w net.ipv4.ip_forward=0; iptables -t nat -D POSTROUTING -s 10.0.0.0/24 -d 192.168.90.0/27 -o ens3 -j MASQUERADE; iptables -D FORWARD -i wg0 -o ens3 -d 192.168.90.0/27 -j ACCEPT; iptables -D FORWARD -i ens3 -o wg0 -s 192.168.90.0/27 -j ACCEPT

# Peer for client-101 (Windows - Active)
[Peer]
PublicKey = rlF4kCtppP75tpIFsRHTEAimYeVYrFOY6qHO3GOtq2Y=
AllowedIPs = 10.0.0.2/32

# Add additional peers below as they are created
```

---

### File: `wg0-minimal.conf`
**Location:** `/etc/wireguard/wg0.conf` (minimal version for testing)  
**Purpose:** Minimal configuration without NAT rules for troubleshooting  
**Permissions:** `chmod 600 /etc/wireguard/wg0.conf`

```ini
[Interface]
Address = 10.0.0.1/24
ListenPort = 51820
# REPLACE WITH YOUR SERVER PRIVATE KEY
PrivateKey = YOUR_SERVER_PRIVATE_KEY_HERE

# Minimal PostUp - only enable IP forwarding
PostUp = sysctl -w net.ipv4.ip_forward=1

# Minimal PostDown - disable IP forwarding
PostDown = sysctl -w net.ipv4.ip_forward=0

# Test peer (REPLACE WITH ACTUAL CLIENT PUBLIC KEY)
[Peer]
PublicKey = CLIENT_PUBLIC_KEY_HERE
AllowedIPs = 10.0.0.2/32
```

---

## 2. Client Configuration Files

### File: `client-101.conf`
**Location:** Client device (Windows/Linux/macOS)  
**Purpose:** Client configuration for first VPN user  
**Platform:** Cross-platform (Windows, Linux, macOS, Android, iOS)

```ini
[Interface]
# Client's private key (REPLACE WITH CLIENT'S PRIVATE KEY)
PrivateKey = CLIENT_101_PRIVATE_KEY_HERE

# IP address assigned to this client
Address = 10.0.0.2/32

# DNS server to use when connected to VPN
DNS = 1.1.1.1

[Peer]
# Server's public key (REPLACE WITH SERVER'S PUBLIC KEY)
PublicKey = SERVER_PUBLIC_KEY_HERE

# Server's public IP and port
# REPLACE 160.191.150.171 WITH YOUR SERVER'S PUBLIC IP
Endpoint = 160.191.150.171:51820

# Networks accessible through the VPN
# 10.0.0.0/24 = VPN network (can communicate with VPN server)
# 192.168.90.0/27 = Private cloud network (can access private VMs)
AllowedIPs = 10.0.0.0/24, 192.168.90.0/27

# Send keepalive packets every 25 seconds to maintain connection
# Important for NAT traversal and connection stability
PersistentKeepalive = 25
```

---

### File: `client-101-production.conf`
**Location:** Client device  
**Purpose:** Production configuration with actual keys  
**Platform:** Cross-platform

```ini
[Interface]
# Actual client-101 private key
PrivateKey = CHNskU3gqlrztURvMa+pAVaNS6ITVsJJpdXVENBSGVA=
Address = 10.0.0.2/32
DNS = 1.1.1.1

[Peer]
# Actual server public key
PublicKey = WFFZlfG9f+j41Y7QUUARKh1lnzzjFA/eOjVevERVUFY=

# Your actual server public IP
Endpoint = 160.191.150.171:51820

AllowedIPs = 10.0.0.0/24, 192.168.90.0/27
PersistentKeepalive = 25
```

---

### File: `client-102.conf`
**Location:** Client device  
**Purpose:** Template for second client  
**Platform:** Cross-platform

```ini
[Interface]
# Client's private key (REPLACE WITH CLIENT-102'S PRIVATE KEY)
PrivateKey = CLIENT_102_PRIVATE_KEY_HERE

# Different IP from client-101 (incremented)
Address = 10.0.0.3/32

# DNS server
DNS = 1.1.1.1

[Peer]
# Server's public key (SAME FOR ALL CLIENTS)
PublicKey = SERVER_PUBLIC_KEY_HERE

# Server's public IP and port (REPLACE WITH YOUR SERVER'S IP)
Endpoint = 160.191.150.171:51820

# Same network access for all clients
AllowedIPs = 10.0.0.0/24, 192.168.90.0/27

# Keepalive
PersistentKeepalive = 25
```

---

### File: `client-103.conf`
**Location:** Client device  
**Purpose:** Template for third client  
**Platform:** Cross-platform

```ini
[Interface]
# Client's private key (REPLACE WITH CLIENT-103'S PRIVATE KEY)
PrivateKey = CLIENT_103_PRIVATE_KEY_HERE

# Different IP from other clients (incremented)
Address = 10.0.0.4/32

DNS = 1.1.1.1

[Peer]
# Server's public key (SAME FOR ALL CLIENTS)
PublicKey = SERVER_PUBLIC_KEY_HERE

# Server's public IP and port (REPLACE WITH YOUR SERVER'S IP)
Endpoint = 160.191.150.171:51820

AllowedIPs = 10.0.0.0/24, 192.168.90.0/27
PersistentKeepalive = 25
```

---

### File: `client-full-tunnel.conf`
**Location:** Client device  
**Purpose:** Route ALL traffic through VPN (not just private networks)  
**Platform:** Cross-platform  
**Use Case:** Full VPN tunnel, all internet traffic encrypted

```ini
[Interface]
# Client's private key (REPLACE WITH YOUR CLIENT'S PRIVATE KEY)
PrivateKey = YOUR_CLIENT_PRIVATE_KEY_HERE

# Client's VPN IP (REPLACE WITH ASSIGNED IP)
Address = 10.0.0.X/32

DNS = 1.1.1.1, 8.8.8.8

[Peer]
# Server's public key
PublicKey = SERVER_PUBLIC_KEY_HERE

# Server endpoint (REPLACE WITH YOUR SERVER'S IP)
Endpoint = 160.191.150.171:51820

# Route ALL traffic through VPN (0.0.0.0/0 = everything)
AllowedIPs = 0.0.0.0/0

PersistentKeepalive = 25
```

---

### File: `client-split-tunnel.conf`
**Location:** Client device  
**Purpose:** Only route specific networks through VPN (split tunnel)  
**Platform:** Cross-platform  
**Use Case:** Access private networks via VPN, everything else uses normal internet

```ini
[Interface]
# Client's private key (REPLACE WITH YOUR CLIENT'S PRIVATE KEY)
PrivateKey = YOUR_CLIENT_PRIVATE_KEY_HERE

# Client's VPN IP (REPLACE WITH ASSIGNED IP)
Address = 10.0.0.X/32

# Use local DNS for normal internet, VPN DNS for private resources
DNS = 1.1.1.1

[Peer]
# Server's public key
PublicKey = SERVER_PUBLIC_KEY_HERE

# Server endpoint (REPLACE WITH YOUR SERVER'S IP)
Endpoint = 160.191.150.171:51820

# Only route these specific networks through VPN
# 10.0.0.0/24 = VPN tunnel network
# 192.168.90.0/27 = Private cloud network
# Add more private networks as needed (e.g., 192.168.100.0/24)
AllowedIPs = 10.0.0.0/24, 192.168.90.0/27

PersistentKeepalive = 25
```

---

## 3. System Configuration Files

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

## 4. Firewall Configuration Files

### File: `iptables-rules-wireguard.sh`
**Location:** `/root/iptables-rules-wireguard.sh`  
**Purpose:** Manual iptables rules script (backup/recovery)  
**Permissions:** `chmod +x /root/iptables-rules-wireguard.sh`

```bash
#!/bin/bash
# WireGuard VPN Gateway - Firewall Rules
# Run this script to manually configure iptables rules

echo "Configuring firewall rules for WireGuard VPN..."

# ==========================================
# INPUT CHAIN - Incoming connections
# ==========================================

# Allow SSH (EDIT PORT IF YOU CHANGED DEFAULT)
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow WireGuard VPN
iptables -A INPUT -p udp --dport 51820 -j ACCEPT

# Allow established and related connections
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow loopback interface
iptables -A INPUT -i lo -j ACCEPT

# Allow ICMP (ping) - OPTIONAL, can be removed for security
iptables -A INPUT -p icmp -j ACCEPT

# ==========================================
# FORWARD CHAIN - Routing between networks
# ==========================================

# Allow VPN clients to access private network
iptables -A FORWARD -i wg0 -o ens3 -d 192.168.90.0/27 -j ACCEPT

# Allow private network to respond to VPN clients
iptables -A FORWARD -i ens3 -o wg0 -s 192.168.90.0/27 -j ACCEPT

# Allow established connections
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# ==========================================
# NAT CHAIN - Network Address Translation
# ==========================================

# MASQUERADE VPN traffic going to private network
# This makes private VMs think requests come from the VPN server
iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -d 192.168.90.0/27 -o ens3 -j MASQUERADE

echo "Firewall rules configured successfully!"
echo ""
echo "To save rules permanently:"
echo "  sudo netfilter-persistent save"
echo ""
echo "To view current rules:"
echo "  sudo iptables -L -n -v"
echo "  sudo iptables -t nat -L -n -v"
```

---

### File: `rules.v4`
**Location:** `/etc/iptables/rules.v4`  
**Purpose:** Persistent IPv4 firewall rules  
**Action:** Saved automatically by netfilter-persistent

```bash
# Generated by iptables-save
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]

# INPUT rules
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -p udp -m udp --dport 51820 -j ACCEPT
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -i lo -j ACCEPT

# FORWARD rules
-A FORWARD -i wg0 -o ens3 -d 192.168.90.0/27 -j ACCEPT
-A FORWARD -i ens3 -o wg0 -s 192.168.90.0/27 -j ACCEPT
-A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

COMMIT

*nat
:PREROUTING ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]

# NAT rules
-A POSTROUTING -s 10.0.0.0/24 -d 192.168.90.0/27 -o ens3 -j MASQUERADE

COMMIT
```

---

### File: `iptables-flush.sh`
**Location:** `/root/iptables-flush.sh`  
**Purpose:** Emergency script to flush all firewall rules  
**Permissions:** `chmod +x /root/iptables-flush.sh`  
**Warning:** ⚠️ Use only for troubleshooting - will remove all firewall protection

```bash
#!/bin/bash
# Emergency firewall flush script
# WARNING: This removes ALL firewall rules

echo "WARNING: Flushing all iptables rules..."
echo "This will remove firewall protection!"
read -p "Are you sure? (yes/no): " confirm

if [ "$confirm" != "yes" ]; then
    echo "Cancelled."
    exit 1
fi

# Flush all rules
iptables -F
iptables -t nat -F
iptables -t mangle -F
iptables -X

# Set default policies to ACCEPT
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

echo "All firewall rules flushed!"
echo "IMPORTANT: Your server is now unprotected!"
echo "Re-apply rules immediately with:"
echo "  /root/iptables-rules-wireguard.sh"
```

---

## 5. Helper Scripts

### File: `generate-client-keys.sh`
**Location:** `/root/wireguard-scripts/generate-client-keys.sh`  
**Purpose:** Automated client key generation script  
**Permissions:** `chmod +x /root/wireguard-scripts/generate-client-keys.sh`

```bash
#!/bin/bash
# WireGuard Client Key Generation Script
# Usage: ./generate-client-keys.sh <client-name>

# Check if client name is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <client-name>"
    echo "Example: $0 client-101"
    exit 1
fi

CLIENT_NAME=$1
KEYS_DIR="/etc/wireguard/clients"

# Create keys directory if it doesn't exist
mkdir -p "$KEYS_DIR"

# Generate keys
echo "Generating keys for $CLIENT_NAME..."
cd "$KEYS_DIR"

wg genkey | tee "${CLIENT_NAME}_private.key" | wg pubkey > "${CLIENT_NAME}_public.key"

# Set proper permissions
chmod 600 "${CLIENT_NAME}_private.key"
chmod 644 "${CLIENT_NAME}_public.key"

# Display keys
echo ""
echo "==================================="
echo "Keys generated for: $CLIENT_NAME"
echo "==================================="
echo ""
echo "Private Key (keep secret):"
cat "${CLIENT_NAME}_private.key"
echo ""
echo "Public Key (add to server config):"
cat "${CLIENT_NAME}_public.key"
echo ""
echo "Files saved to: $KEYS_DIR"
echo ""
echo "Next steps:"
echo "1. Add the public key to /etc/wireguard/wg0.conf"
echo "2. Restart WireGuard: sudo wg-quick down wg0 && sudo wg-quick up wg0"
echo "3. Create client config with the private key"
```

---

### File: `create-client-config.sh`
**Location:** `/root/wireguard-scripts/create-client-config.sh`  
**Purpose:** Generate complete client configuration file  
**Permissions:** `chmod +x /root/wireguard-scripts/create-client-config.sh`

```bash
#!/bin/bash
# WireGuard Client Configuration Generator
# Usage: ./create-client-config.sh <client-name> <client-ip>

# Check arguments
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <client-name> <client-ip>"
    echo "Example: $0 client-101 10.0.0.2"
    exit 1
fi

CLIENT_NAME=$1
CLIENT_IP=$2
KEYS_DIR="/etc/wireguard/clients"
OUTPUT_DIR="/root/wireguard-configs"

# EDIT THESE VALUES FOR YOUR SETUP
SERVER_PUBLIC_KEY="WFFZlfG9f+j41Y7QUUARKh1lnzzjFA/eOjVevERVUFY="  # REPLACE WITH YOUR SERVER PUBLIC KEY
SERVER_ENDPOINT="160.191.150.171:51820"  # REPLACE WITH YOUR SERVER PUBLIC IP

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Check if client keys exist
if [ ! -f "$KEYS_DIR/${CLIENT_NAME}_private.key" ]; then
    echo "Error: Client keys not found for $CLIENT_NAME"
    echo "Run generate-client-keys.sh first"
    exit 1
fi

# Read client private key
CLIENT_PRIVATE_KEY=$(cat "$KEYS_DIR/${CLIENT_NAME}_private.key")

# Generate configuration file
CONFIG_FILE="$OUTPUT_DIR/${CLIENT_NAME}.conf"

cat > "$CONFIG_FILE" << EOF
[Interface]
PrivateKey = $CLIENT_PRIVATE_KEY
Address = $CLIENT_IP/32
DNS = 1.1.1.1

[Peer]
PublicKey = $SERVER_PUBLIC_KEY
Endpoint = $SERVER_ENDPOINT
AllowedIPs = 10.0.0.0/24, 192.168.90.0/27
PersistentKeepalive = 25
EOF

# Set permissions
chmod 600 "$CONFIG_FILE"

echo ""
echo "==================================="
echo "Client config generated: $CLIENT_NAME"
echo "==================================="
echo ""
echo "Configuration file: $CONFIG_FILE"
echo ""
echo "Configuration content:"
cat "$CONFIG_FILE"
echo ""
echo "Send this file securely to the client."
echo "They can import it into WireGuard application."
```

---

### File: `add-client-to-server.sh`
**Location:** `/root/wireguard-scripts/add-client-to-server.sh`  
**Purpose:** Automatically add client peer to server configuration  
**Permissions:** `chmod +x /root/wireguard-scripts/add-client-to-server.sh`

```bash
#!/bin/bash
# Add WireGuard Client to Server Configuration
# Usage: ./add-client-to-server.sh <client-name> <client-ip>

# Check arguments
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <client-name> <client-ip>"
    echo "Example: $0 client-101 10.0.0.2"
    exit 1
fi

CLIENT_NAME=$1
CLIENT_IP=$2
KEYS_DIR="/etc/wireguard/clients"
SERVER_CONFIG="/etc/wireguard/wg0.conf"

# Check if client public key exists
if [ ! -f "$KEYS_DIR/${CLIENT_NAME}_public.key" ]; then
    echo "Error: Client public key not found for $CLIENT_NAME"
    echo "Run generate-client-keys.sh first"
    exit 1
fi

# Read client public key
CLIENT_PUBLIC_KEY=$(cat "$KEYS_DIR/${CLIENT_NAME}_public.key")

# Backup current configuration
cp "$SERVER_CONFIG" "${SERVER_CONFIG}.backup-$(date +%Y%m%d-%H%M%S)"

# Add peer to configuration
cat >> "$SERVER_CONFIG" << EOF

# Peer for $CLIENT_NAME
[Peer]
PublicKey = $CLIENT_PUBLIC_KEY
AllowedIPs = $CLIENT_IP/32
EOF

echo ""
echo "==================================="
echo "Client added to server: $CLIENT_NAME"
echo "==================================="
echo ""
echo "Client IP: $CLIENT_IP"
echo "Public Key: $CLIENT_PUBLIC_KEY"
echo ""
echo "Restarting WireGuard..."

# Restart WireGuard
wg-quick down wg0 2>/dev/null
wg-quick up wg0

if [ $? -eq 0 ]; then
    echo "WireGuard restarted successfully!"
    echo ""
    echo "Verify with: sudo wg show"
else
    echo "Error: WireGuard failed to start!"
    echo "Check configuration: sudo wg-quick up wg0"
    echo "Restore backup if needed: cp ${SERVER_CONFIG}.backup-* $SERVER_CONFIG"
fi
```

---

### File: `remove-client-from-server.sh`
**Location:** `/root/wireguard-scripts/remove-client-from-server.sh`  
**Purpose:** Remove client from server configuration  
**Permissions:** `chmod +x /root/wireguard-scripts/remove-client-from-server.sh`

```bash
#!/bin/bash
# Remove WireGuard Client from Server
# Usage: ./remove-client-from-server.sh <client-name>

if [ -z "$1" ]; then
    echo "Usage: $0 <client-name>"
    echo "Example: $0 client-101"
    exit 1
fi

CLIENT_NAME=$1
KEYS_DIR="/etc/wireguard/clients"
SERVER_CONFIG="/etc/wireguard/wg0.conf"

# Check if client exists
if [ ! -f "$KEYS_DIR/${CLIENT_NAME}_public.key" ]; then
    echo "Warning: Client keys not found for $CLIENT_NAME"
    echo "Proceeding with configuration removal anyway..."
fi

# Backup current configuration
cp "$SERVER_CONFIG" "${SERVER_CONFIG}.backup-$(date +%Y%m%d-%H%M%S)"

# Remove peer section (this is a simple version, may need manual verification)
echo "Manually remove the [Peer] section for $CLIENT_NAME from $SERVER_CONFIG"
echo "Backup saved to: ${SERVER_CONFIG}.backup-$(date +%Y%m%d-%H%M%S)"
echo ""
echo "After removing, restart WireGuard:"
echo "  sudo wg-quick down wg0 && sudo wg-quick up wg0"
echo ""
echo "To also remove client keys:"
echo "  rm $KEYS_DIR/${CLIENT_NAME}_*"
```

---

### File: `wireguard-status.sh`
**Location:** `/root/wireguard-scripts/wireguard-status.sh`  
**Purpose:** Display comprehensive WireGuard status  
**Permissions:** `chmod +x /root/wireguard-scripts/wireguard-status.sh`

```bash
#!/bin/bash
# WireGuard VPN Status Dashboard

echo "=========================================="
echo "WireGuard VPN Gateway Status"
echo "=========================================="
echo ""

# Service status
echo "=== Service Status ==="
systemctl status wg-quick@wg0 | grep "Active:"
echo ""

# Interface status
echo "=== Interface Status ==="
if ip link show wg0 &>/dev/null; then
    echo "✓ wg0 interface is UP"
    ip addr show wg0 | grep "inet "
else
    echo "✗ wg0 interface is DOWN"
fi
echo ""

# WireGuard peers
echo "=== Connected Peers ==="
wg show wg0 2>/dev/null | grep -E "(peer|latest handshake|transfer)" || echo "No peers configured"
echo ""

# Firewall status
echo "=== Firewall Rules ==="
echo "NAT Rules:"
iptables -t nat -L POSTROUTING -n | grep MASQUERADE | wc -l | xargs echo "  Active NAT rules:"
echo ""
echo "Forward Rules:"
iptables -L FORWARD -n | grep -c "ACCEPT" | xargs echo "  Active forward rules:"
echo ""

# IP Forwarding
echo "=== IP Forwarding ==="
if [ "$(cat /proc/sys/net/ipv4/ip_forward)" = "1" ]; then
    echo "✓ IP forwarding is ENABLED"
else
    echo "✗ IP forwarding is DISABLED"
fi
echo ""

# Listening port
echo "=== Listening Port ==="
ss -ulnp | grep :51820 || echo "✗ WireGuard not listening on port 51820"
echo ""

# System resources
echo "=== System Resources ==="
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "  Usage: " 100 - $1 "%"}'
echo "Memory Usage:"
free -h | grep Mem | awk '{print "  Used: " $3 " / " $2}'
echo "Disk Usage:"
df -h / | tail -1 | awk '{print "  Used: " $3 " / " $2 " (" $5 ")"}'
echo ""

echo "=========================================="
echo "For detailed peer info: sudo wg show wg0"
echo "For live monitoring: watch -n 2 sudo wg show wg0"
echo "=========================================="
```

---

### File: `backup-wireguard.sh`
**Location:** `/root/wireguard-scripts/backup-wireguard.sh`  
**Purpose:** Backup all WireGuard configurations  
**Permissions:** `chmod +x /root/wireguard-scripts/backup-wireguard.sh`

```bash
#!/bin/bash
# WireGuard Configuration Backup Script

BACKUP_DIR="/root/wireguard-backups"
DATE=$(date +%Y%m%d-%H%M%S)
BACKUP_FILE="$BACKUP_DIR/wireguard-backup-$DATE.tar.gz"

# Create backup directory
mkdir -p "$BACKUP_DIR"

echo "Creating WireGuard backup..."
echo "Backup file: $BACKUP_FILE"

# Create tar archive
tar -czf "$BACKUP_FILE" \
    /etc/wireguard/ \
    /etc/sysctl.conf \
    /etc/iptables/rules.v4 \
    /root/wireguard-scripts/ 2>/dev/null

if [ $? -eq 0 ]; then
    echo "✓ Backup created successfully!"
    echo ""
    echo "Backup contains:"
    tar -tzf "$BACKUP_FILE" | head -10
    echo "..."
    echo ""
    echo "File size: $(du -h $BACKUP_FILE | cut -f1)"
    echo ""
    echo "To restore:"
    echo "  sudo tar -xzf $BACKUP_FILE -C /"
    echo ""
    echo "Keep old backups: $(ls -1 $BACKUP_DIR/wireguard-backup-*.tar.gz | wc -l) backups found"
else
    echo "✗ Backup failed!"
    exit 1
fi
```

---

### File: `restore-wireguard.sh`
**Location:** `/root/wireguard-scripts/restore-wireguard.sh`  
**Purpose:** Restore WireGuard from backup  
**Permissions:** `chmod +x /root/wireguard-scripts/restore-wireguard.sh`

```bash
#!/bin/bash
# WireGuard Configuration Restore Script

if [ -z "$1" ]; then
    echo "Usage: $0 <backup-file>"
    echo ""
    echo "Available backups:"
    ls -lh /root/wireguard-backups/wireguard-backup-*.tar.gz 2>/dev/null || echo "No backups found"
    exit 1
fi

BACKUP_FILE=$1

if [ ! -f "$BACKUP_FILE" ]; then
    echo "Error: Backup file not found: $BACKUP_FILE"
    exit 1
fi

echo "WARNING: This will restore WireGuard configuration from backup"
echo "Current configuration will be overwritten!"
echo ""
echo "Backup file: $BACKUP_FILE"
read -p "Continue? (yes/no): " confirm

if [ "$confirm" != "yes" ]; then
    echo "Cancelled."
    exit 0
fi

# Stop WireGuard
echo "Stopping WireGuard..."
wg-quick down wg0 2>/dev/null

# Restore from backup
echo "Restoring from backup..."
tar -xzf "$BACKUP_FILE" -C /

if [ $? -eq 0 ]; then
    echo "✓ Restore completed successfully!"
    echo ""
    echo "Starting WireGuard..."
    wg-quick up wg0
    
    if [ $? -eq 0 ]; then
        echo "✓ WireGuard started successfully!"
        echo ""
        echo "Verify with: sudo wg show"
    else
        echo "✗ WireGuard failed to start!"
        echo "Check configuration manually"
    fi
else
    echo "✗ Restore failed!"
    exit 1
fi
```

---

## Configuration Files Summary

### Server Files Checklist
- [ ] `/etc/wireguard/wg0.conf` - Main server configuration
- [ ] `/etc/sysctl.conf` - IP forwarding enabled
- [ ] `/etc/iptables/rules.v4` - Persistent firewall rules
- [ ] `/etc/systemd/system/wg-quick@.service.d/override.conf` - Service overrides (optional)

### Client Files Checklist
- [ ] `client-XXX.conf` - Client configuration files
- [ ] Different IP for each client (10.0.0.2, 10.0.0.3, etc.)
- [ ] Server public key same for all clients
- [ ] Server endpoint IP correct

### Helper Scripts Checklist
- [ ] `/root/wireguard-scripts/generate-client-keys.sh`
- [ ] `/root/wireguard-scripts/create-client-config.sh`
- [ ] `/root/wireguard-scripts/add-client-to-server.sh`
- [ ] `/root/wireguard-scripts/remove-client-from-server.sh`
- [ ] `/root/wireguard-scripts/wireguard-status.sh`
- [ ] `/root/wireguard-scripts/backup-wireguard.sh`
- [ ] `/root/wireguard-scripts/restore-wireguard.sh`
- [ ] `/root/iptables-rules-wireguard.sh`
- [ ] `/root/iptables-flush.sh`

---

## Quick Deployment Guide

### 1. Copy Server Configuration
```bash
# Copy wg0.conf template
sudo nano /etc/wireguard/wg0.conf
# Paste the template and edit values
sudo chmod 600 /etc/wireguard/wg0.conf
```

### 2. Copy Helper Scripts
```bash
# Create scripts directory
sudo mkdir -p /root/wireguard-scripts

# Copy each script
sudo nano /root/wireguard-scripts/generate-client-keys.sh
# Paste script content
sudo chmod +x /root/wireguard-scripts/generate-client-keys.sh

# Repeat for other scripts
```

### 3. Enable IP Forwarding
```bash
# Add to sysctl.conf
echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
```

### 4. Configure Firewall
```bash
# Run firewall script
sudo bash /root/iptables-rules-wireguard.sh
sudo netfilter-persistent save
```

### 5. Start WireGuard
```bash
sudo wg-quick up wg0
sudo systemctl enable wg-quick@wg0
```

---

## Important Notes

### ⚠️ Security Reminders
1. **Never share private keys** - Keep them secure and confidential
2. **Replace placeholder keys** - Use actual generated keys in configurations
3. **Backup configurations** - Use the backup script regularly
4. **Restrict SSH access** - Consider IP whitelisting for SSH
5. **Monitor logs** - Check `/var/log/syslog` for issues

### 📝 Customization Required
Before using these configurations, you MUST:
1. Generate your own server keys
2. Replace `YOUR_SERVER_PUBLIC_KEY` with actual server public key
3. Replace `YOUR_SERVER_PRIVATE_KEY` with actual server private key
4. Replace `160.191.150.171` with your actual server public IP
5. Generate unique keys for each client
6. Assign unique IPs to each client (10.0.0.2, 10.0.0.3, etc.)
7. Update network interface names if different from `ens3`

### 🔧 File Permissions
Always set correct permissions:
```bash
# Configuration files
chmod 600 /etc/wireguard/*.conf
chmod 600 /etc/wireguard/*.key

# Scripts
chmod +x /root/wireguard-scripts/*.sh
chmod +x /root/*.sh
```

---

**Document Version:** 1.0  
**Last Updated:** December 10, 2025  
**Compatibility:** Ubuntu Server 24.04 LTS, WireGuard 1.0.x
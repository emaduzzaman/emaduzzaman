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
## Client Configuration Files

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
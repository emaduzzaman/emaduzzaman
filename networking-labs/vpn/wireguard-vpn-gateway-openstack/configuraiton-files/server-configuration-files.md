## Server Configuration Files

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
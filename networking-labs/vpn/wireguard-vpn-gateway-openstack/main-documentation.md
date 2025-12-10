# WireGuard VPN Server on Pico Public Cloud
## Complete Production Documentation

---

## Table of Contents
1. [Executive Summary](#executive-summary)
2. [Architecture Overview](#architecture-overview)
3. [Technical Specifications](#technical-specifications)
4. [Network Topology](#network-topology)
5. [Installation Guide](#installation-guide)
6. [Configuration Details](#configuration-details)
7. [Client Setup](#client-setup)
8. [Problems Faced & Solutions](#problems-faced--solutions)
9. [Testing & Verification](#testing--verification)
10. [Adding Additional Clients](#adding-additional-clients)
11. [Security Hardening](#security-hardening)
12. [Maintenance & Monitoring](#maintenance--monitoring)
13. [Troubleshooting Guide](#troubleshooting-guide)

---

## 1. Executive Summary

### What This Solution Does
This WireGuard VPN solution creates a **secure gateway** that allows remote users to access private virtual machines in the Pico Public Cloud as if they were on the same local network. 

**In Simple Terms:**
- You have VMs in the cloud that don't have public IPs
- The WireGuard server acts as a "door" to reach these VMs
- Remote users connect through the VPN and can access any VM on the private network (192.168.90.0/27)
- All traffic is encrypted and secure

### Business Value
- **Secure Remote Access**: Employees can access internal cloud resources from anywhere
- **Cost Effective**: No need for individual public IPs for each VM
- **Centralized Control**: Single point of access management
- **High Performance**: WireGuard is faster than traditional VPNs

---

## 2. Architecture Overview

### High-Level Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                     INTERNET (Public Network)                        │
└────────────────┬────────────────────────────────────────────────────┘
                 │
                 │ Connection via
                 │ 160.191.150.171:51820 (Public IP)
                 │
                 ▼
┌────────────────────────────────────────────────────────────────────┐
│                    WireGuard VPN Server                             │
│  ┌──────────────────────────────────────────────────────────────┐  │
│  │  Hostname: wireguard                                         │  │
│  │  Public IP: 160.191.150.171                                  │  │
│  │  Private IP: 192.168.90.20/27                                │  │
│  │  VPN Network: 10.0.0.1/24                                    │  │
│  │  Interface: ens3 (LAN), wg0 (VPN)                            │  │
│  │  OS: Ubuntu Server 24.04 LTS                                 │  │
│  │  Resources: 1 vCPU, 2GB RAM, 20GB SSD                        │  │
│  └──────────────────────────────────────────────────────────────┘  │
└────────────────┬───────────────────────────────────────────────────┘
                 │
                 │ NAT + Routing
                 │
                 ▼
┌────────────────────────────────────────────────────────────────────┐
│          Private Cloud Network: 192.168.90.0/27                     │
│  ┌──────────────────────────────────────────────────────────────┐  │
│  │  Gateway: 192.168.90.1                                       │  │
│  │  DHCP Range: 192.168.90.2 - 192.168.90.30                    │  │
│  │  DNS: 8.8.8.8                                                │  │
│  │  Network Name: wireguard-vpn_192-168-90-0/27                 │  │
│  └──────────────────────────────────────────────────────────────┘  │
│                                                                      │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐             │
│  │   Test VM    │  │   Future VM  │  │   Future VM  │             │
│  │ 192.168.90.10│  │192.168.90.11 │  │192.168.90.12 │             │
│  └──────────────┘  └──────────────┘  └──────────────┘             │
│                                                                      │
└────────────────────────────────────────────────────────────────────┘


┌────────────────────────────────────────────────────────────────────┐
│                    Remote VPN Clients                               │
│                                                                      │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐             │
│  │  Client-101  │  │  Client-102  │  │  Client-N    │             │
│  │  10.0.0.2/32 │  │  10.0.0.3/32 │  │  10.0.0.N/32 │             │
│  │  (Windows)   │  │  (MacOS)     │  │  (Linux)     │             │
│  └──────────────┘  └──────────────┘  └──────────────┘             │
│                                                                      │
│  Each client gets assigned a VPN IP in 10.0.0.0/24 network         │
│  and can access all VMs in 192.168.90.0/27                         │
└────────────────────────────────────────────────────────────────────┘
```

### Traffic Flow Diagram

```
Client (10.0.0.2) wants to access VM (192.168.90.10)
     │
     │ 1. Encrypted WireGuard tunnel
     ▼
WireGuard Server (160.191.150.171:51820)
     │
     │ 2. Decryption + NAT translation
     │ 3. Forward to private network
     ▼
Private VM (192.168.90.10)
     │
     │ 4. Response back to server
     ▼
WireGuard Server
     │
     │ 5. NAT translation + Encryption
     ▼
Client receives response
```

---

## 3. Technical Specifications

### Server Specifications

| Component | Specification |
|-----------|--------------|
| **Platform** | Pico Public Cloud (OpenStack-based) |
| **VM Name** | wireguard |
| **Operating System** | Ubuntu Server 24.04.2 LTS |
| **Kernel** | 6.8.0-88-generic |
| **CPU** | 1 vCPU |
| **RAM** | 2 GB |
| **Storage** | 20 GB NVMe SSD |
| **Network Interface** | ens3 (8942 MTU) |
| **WireGuard Version** | 1.0.20210914 |

### Network Configuration

#### Public Network
- **Floating/Elastic IP**: 160.191.150.171
- **Purpose**: External access point for VPN connections

#### Private Cloud Network
- **Network Name**: wireguard-vpn_192-168-90-0/27
- **Network Address**: 192.168.90.0/27 (32 addresses total)
- **Gateway IP**: 192.168.90.1
- **Usable IP Range**: 192.168.90.2 - 192.168.90.30
- **WireGuard Server IP**: 192.168.90.20/27
- **DHCP**: Enabled
- **DNS**: 8.8.8.8
- **Subnet Mask**: 255.255.255.224 (/27)

#### VPN Network (WireGuard Tunnel)
- **Network Address**: 10.0.0.0/24
- **Server VPN IP**: 10.0.0.1/24
- **Client IP Range**: 10.0.0.2 - 10.0.0.254
- **MTU**: 8862 bytes (auto-calculated by WireGuard)

### Port Configuration

| Port | Protocol | Purpose | Direction |
|------|----------|---------|-----------|
| 22 | TCP | SSH Management | Inbound |
| 51820 | UDP | WireGuard VPN | Inbound |

---

## 4. Network Topology

### IP Addressing Scheme

```
┌─────────────────────────────────────────────────────────────┐
│                    IP Address Allocation                     │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  PUBLIC INTERNET                                             │
│  └─ 160.191.150.171 (WireGuard Server Public IP)            │
│                                                              │
│  VPN TUNNEL NETWORK (10.0.0.0/24)                           │
│  ├─ 10.0.0.1       → WireGuard Server VPN interface         │
│  ├─ 10.0.0.2       → Client-101 (Windows)                   │
│  ├─ 10.0.0.3       → Client-102 (reserved)                  │
│  ├─ 10.0.0.4       → Client-103 (reserved)                  │
│  └─ 10.0.0.5-254   → Available for future clients           │
│                                                              │
│  PRIVATE CLOUD NETWORK (192.168.90.0/27)                    │
│  ├─ 192.168.90.0   → Network address (unusable)             │
│  ├─ 192.168.90.1   → Gateway (cloud router)                 │
│  ├─ 192.168.90.2-19→ Available DHCP pool                    │
│  ├─ 192.168.90.20  → WireGuard Server (ens3 interface)      │
│  ├─ 192.168.90.10  → Test VM (Ubuntu)                       │
│  ├─ 192.168.90.21-30→ Available DHCP pool                   │
│  └─ 192.168.90.31  → Broadcast address (unusable)           │
│                                                              │
└─────────────────────────────────────────────────────────────┘
```

### Routing Table

```
Destination         Gateway         Genmask         Interface
─────────────────────────────────────────────────────────────
10.0.0.0           0.0.0.0         255.255.255.0   wg0
192.168.90.0       0.0.0.0         255.255.255.224 ens3
0.0.0.0            192.168.90.1    0.0.0.0         ens3
```

---

## 5. Installation Guide

### Step 1: Create Virtual Machine in Pico Cloud Portal

#### 1.1 Create Network
```
Navigation: Network → Networks → Create Network

Network Details:
  - Network Name: wireguard-vpn_192-168-90-0/27
  - Admin State: UP
  - Shared: No
  
Subnet Configuration:
  - Subnet Name: wireguard-subnet
  - Network Address: 192.168.90.0/27
  - IP Version: IPv4
  - Gateway IP: 192.168.90.1
  - DHCP: Enable
  - Allocation Pools: 192.168.90.2,192.168.90.30
  - DNS Name Servers: 8.8.8.8
```

#### 1.2 Create Security Group
```
Navigation: Network → Security Groups → Create Security Group

Name: wireguard-security-group

Rules to Add:
  1. SSH Access
     - Direction: Ingress
     - Protocol: TCP
     - Port: 22
     - Remote IP: 0.0.0.0/0 (or restrict to your IP)
  
  2. WireGuard VPN
     - Direction: Ingress
     - Protocol: UDP
     - Port: 51820
     - Remote IP: 0.0.0.0/0
  
  3. ICMP (Ping) - Optional for testing
     - Direction: Ingress
     - Protocol: ICMP
     - Remote IP: 0.0.0.0/0
```

#### 1.3 Create SSH Key Pair
```
Navigation: Compute → Key Pairs → Create Key Pair

Name: wireguard-server
Key Type: SSH Key

Download: wireguard-server.pem
Save to: ~/.ssh/wireguard-server.pem
```

#### 1.4 Launch Instance
```
Navigation: Compute → Instances → Launch Instance

Details:
  - Instance Name: wireguard
  - Availability Zone: nova
  - Count: 1

Source:
  - Select Boot Source: Image
  - Image: Ubuntu Server 24.04 LTS
  - Size: 20 GB

Flavor:
  - vCPU: 1
  - RAM: 2048 MB
  - Disk: 20 GB

Networks:
  - Select: wireguard-vpn_192-168-90-0/27

Security Groups:
  - Select: wireguard-security-group

Key Pair:
  - Select: wireguard-server
```

#### 1.5 Assign Floating IP
```
Navigation: Network → Floating IPs → Allocate IP

Associate with: wireguard instance

Assigned IP: 160.191.150.171
```

---

### Step 2: Initial Server Configuration

#### 2.1 Connect to Server
```bash
# Set proper permissions for key
chmod 600 ~/.ssh/wireguard-server.pem

# Connect via SSH
ssh -i ~/.ssh/wireguard-server.pem ubuntu@160.191.150.171
```

#### 2.2 Update System
```bash
sudo apt update && sudo apt upgrade -y
```

**Expected Output:**
- System packages updated
- Kernel upgraded to 6.8.0-88-generic
- Note: Reboot will be needed later

#### 2.3 Enable IP Forwarding (Permanent)
```bash
# Add to sysctl configuration
echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.conf

# Apply immediately
sudo sysctl -p

# Verify
sudo sysctl net.ipv4.ip_forward
```

**Expected Output:**
```
net.ipv4.ip_forward = 1
```

#### 2.4 Install WireGuard
```bash
sudo apt install wireguard -y
```

**Expected Output:**
```
The following NEW packages will be installed:
  wireguard wireguard-tools
```

---

### Step 3: WireGuard Configuration

#### 3.1 Generate Server Keys
```bash
# Create WireGuard directory and set permissions
sudo bash
cd /etc/wireguard
umask 077

# Generate server keys
wg genkey | tee server_private.key | wg pubkey > server_public.key

# View keys
cat server_private.key
cat server_public.key

# Set proper permissions
chmod 600 server_private.key server_public.key
```

**Generated Keys (Example from your setup):**
```
Private Key: 8LMQBoynitujxfoyXPfih/XqV+uQN297AHLs+MQ3rHc=
Public Key: WFFZlfG9f+j41Y7QUUARKh1lnzzjFA/eOjVevERVUFY=
```

#### 3.2 Create Server Configuration
```bash
nano /etc/wireguard/wg0.conf
```

**Configuration File:**
```ini
[Interface]
Address = 10.0.0.1/24
ListenPort = 51820
PrivateKey = 8LMQBoynitujxfoyXPfih/XqV+uQN297AHLs+MQ3rHc=
PostUp = sysctl -w net.ipv4.ip_forward=1; iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -d 192.168.90.0/27 -o ens3 -j MASQUERADE; iptables -A FORWARD -i wg0 -o ens3 -d 192.168.90.0/27 -j ACCEPT; iptables -A FORWARD -i ens3 -o wg0 -s 192.168.90.0/27 -j ACCEPT
PostDown = sysctl -w net.ipv4.ip_forward=0; iptables -t nat -D POSTROUTING -s 10.0.0.0/24 -d 192.168.90.0/27 -o ens3 -j MASQUERADE; iptables -D FORWARD -i wg0 -o ens3 -d 192.168.90.0/27 -j ACCEPT; iptables -D FORWARD -i ens3 -o wg0 -s 192.168.90.0/27 -j ACCEPT

# Peer configurations will be added below
```

**Configuration Explanation:**
- `Address`: VPN server IP in tunnel network
- `ListenPort`: UDP port for VPN connections
- `PrivateKey`: Server's private key (keep secret!)
- `PostUp`: Commands to run when VPN starts
  - Enable IP forwarding
  - Setup NAT for VPN → LAN traffic
  - Allow forwarding from VPN to LAN
  - Allow forwarding from LAN to VPN
- `PostDown`: Cleanup commands when VPN stops

```bash
# Set proper permissions
chmod 600 /etc/wireguard/wg0.conf
```

---

### Step 4: Firewall Configuration

#### 4.1 Install and Configure iptables
```bash
# Install iptables-persistent
sudo apt install iptables-persistent -y
```

**Note:** This will remove UFW if installed (package conflict)

#### 4.2 Configure Firewall Rules
```bash
# Allow SSH
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow WireGuard
sudo iptables -A INPUT -p udp --dport 51820 -j ACCEPT

# Allow established connections
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow loopback
sudo iptables -A INPUT -i lo -j ACCEPT

# Save rules
sudo netfilter-persistent save
```

---

### Step 5: Start WireGuard Service

#### 5.1 Start WireGuard
```bash
sudo wg-quick up wg0
```

**Expected Output:**
```
[#] ip link add wg0 type wireguard
[#] wg setconf wg0 /dev/fd/63
[#] ip -4 address add 10.0.0.1/24 dev wg0
[#] ip link set mtu 8862 up dev wg0
[#] sysctl -w net.ipv4.ip_forward=1
net.ipv4.ip_forward = 1
```

#### 5.2 Enable Auto-Start on Boot
```bash
sudo systemctl enable wg-quick@wg0
```

#### 5.3 Verify Service
```bash
# Check WireGuard status
sudo wg show

# Check interface
ip addr show wg0

# Check NAT rules
sudo iptables -t nat -L -n -v | grep MASQUERADE

# Check forwarding rules
sudo iptables -L FORWARD -n -v
```

**Expected Output for `sudo wg show`:**
```
interface: wg0
  public key: WFFZlfG9f+j41Y7QUUARKh1lnzzjFA/eOjVevERVUFY=
  private key: (hidden)
  listening port: 51820
```

---

## 6. Configuration Details

### WireGuard Server Configuration Breakdown

```ini
[Interface]
Address = 10.0.0.1/24          # Server's VPN IP address
ListenPort = 51820              # UDP port to listen on
PrivateKey = <SERVER_PRIVATE>   # Server's private key

# PostUp: Commands executed when tunnel comes up
PostUp = sysctl -w net.ipv4.ip_forward=1; \
         iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -d 192.168.90.0/27 -o ens3 -j MASQUERADE; \
         iptables -A FORWARD -i wg0 -o ens3 -d 192.168.90.0/27 -j ACCEPT; \
         iptables -A FORWARD -i ens3 -o wg0 -s 192.168.90.0/27 -j ACCEPT

# PostDown: Cleanup commands when tunnel goes down
PostDown = sysctl -w net.ipv4.ip_forward=0; \
           iptables -t nat -D POSTROUTING -s 10.0.0.0/24 -d 192.168.90.0/27 -o ens3 -j MASQUERADE; \
           iptables -D FORWARD -i wg0 -o ens3 -d 192.168.90.0/27 -j ACCEPT; \
           iptables -D FORWARD -i ens3 -o wg0 -s 192.168.90.0/27 -j ACCEPT
```

### NAT and Routing Explanation

#### NAT Rule (MASQUERADE)
```bash
iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -d 192.168.90.0/27 -o ens3 -j MASQUERADE
```
**Purpose:** Translates VPN client IPs to server's LAN IP so private VMs can respond

**Example:**
```
Client sends: 10.0.0.2 → 192.168.90.10
After NAT: 192.168.90.20 → 192.168.90.10
VM responds to 192.168.90.20, which forwards back to 10.0.0.2
```

#### Forward Rules
```bash
# Allow VPN → LAN
iptables -A FORWARD -i wg0 -o ens3 -d 192.168.90.0/27 -j ACCEPT

# Allow LAN → VPN
iptables -A FORWARD -i ens3 -o wg0 -s 192.168.90.0/27 -j ACCEPT
```
**Purpose:** Allows packet forwarding between VPN and LAN interfaces

---

## 7. Client Setup

### Step 1: Generate Client Keys on Server

```bash
# Connect to server
ssh -i wireguard-server.pem ubuntu@160.191.150.171
sudo bash
cd /etc/wireguard

# Generate keys for client-101
wg genkey | tee client-101_private.key | wg pubkey > client-101_public.key

# View keys (save these securely!)
cat client-101_private.key
cat client-101_public.key
```

**Generated Keys (Example from your setup):**
```
Private Key: CHNskU3gqlrztURvMa+pAVaNS6ITVsJJpdXVENBSGVA=
Public Key: rlF4kCtppP75tpIFsRHTEAimYeVYrFOY6qHO3GOtq2Y=
```

---

### Step 2: Add Client to Server Configuration

```bash
nano /etc/wireguard/wg0.conf
```

**Add peer section:**
```ini
# Peer for client-101
[Peer]
PublicKey = rlF4kCtppP75tpIFsRHTEAimYeVYrFOY6qHO3GOtq2Y=
AllowedIPs = 10.0.0.2/32
```

**Restart WireGuard:**
```bash
sudo wg-quick down wg0
sudo wg-quick up wg0

# Verify peer is added
sudo wg show
```

**Expected Output:**
```
interface: wg0
  public key: WFFZlfG9f+j41Y7QUUARKh1lnzzjFA/eOjVevERVUFY=
  private key: (hidden)
  listening port: 51820

peer: rlF4kCtppP75tpIFsRHTEAimYeVYrFOY6qHO3GOtq2Y=
  allowed ips: 10.0.0.2/32
```

---

### Step 3: Configure Windows Client

#### 3.1 Install WireGuard for Windows
1. Download from: https://www.wireguard.com/install/
2. Install the application
3. Open WireGuard application

#### 3.2 Create Client Configuration

**Create file: client-101.conf**
```ini
[Interface]
PrivateKey = CHNskU3gqlrztURvMa+pAVaNS6ITVsJJpdXVENBSGVA=
Address = 10.0.0.2/32
DNS = 1.1.1.1

[Peer]
PublicKey = WFFZlfG9f+j41Y7QUUARKh1lnzzjFA/eOjVevERVUFY=
Endpoint = 160.191.150.171:51820
AllowedIPs = 10.0.0.0/24, 192.168.90.0/27
PersistentKeepalive = 25
```

**Configuration Explanation:**
- `PrivateKey`: Client's private key
- `Address`: Client's VPN IP address
- `DNS`: DNS server for the client
- `PublicKey`: Server's public key
- `Endpoint`: Server's public IP and port
- `AllowedIPs`: Networks accessible through VPN
  - `10.0.0.0/24`: VPN network (can ping server)
  - `192.168.90.0/27`: Private cloud network (can access VMs)
- `PersistentKeepalive`: Keeps connection alive through NAT (25 seconds)

#### 3.3 Import and Activate

1. Open WireGuard application
2. Click "Add Tunnel" → "Add empty tunnel..."
3. Paste the configuration
4. Save as "client-101"
5. Click "Activate"

---

### Step 4: Configure Linux Client

```bash
# Install WireGuard
sudo apt install wireguard -y

# Create configuration
sudo nano /etc/wireguard/client-101.conf
```

**Paste the same configuration as above**

```bash
# Start VPN
sudo wg-quick up client-101

# Enable on boot
sudo systemctl enable wg-quick@client-101
```

---

### Step 5: Configure macOS Client

1. Install WireGuard from App Store
2. Click "+" → "Add Empty Tunnel"
3. Paste the configuration
4. Save and activate

---

## 8. Problems Faced & Solutions

### Problem 1: UFW vs iptables-persistent Conflict

**Issue:**
```bash
sudo apt install iptables-persistent
# UFW was automatically removed
```

**Root Cause:**
- UFW and iptables-persistent are conflicting packages
- Both try to manage the same iptables rules
- Cannot be installed simultaneously

**Initial Attempt:**
```bash
# Tried using UFW commands in wg0.conf PostUp
PostUp = ... ufw route allow in on wg0 ...
# Result: "ufw: command not found"
```

**Solution:**
Removed UFW commands from WireGuard configuration and used pure iptables rules:

```ini
PostUp = sysctl -w net.ipv4.ip_forward=1; \
         iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -d 192.168.90.0/27 -o ens3 -j MASQUERADE; \
         iptables -A FORWARD -i wg0 -o ens3 -d 192.168.90.0/27 -j ACCEPT; \
         iptables -A FORWARD -i ens3 -o wg0 -s 192.168.90.0/27 -j ACCEPT
```

**Lesson Learned:**
Choose one firewall solution (UFW OR iptables-persistent), not both. For production VPN servers, direct iptables is more flexible.

---

### Problem 2: Duplicate NAT Rules

**Issue:**
```bash
sudo iptables -t nat -L -n -v | grep MASQUERADE
# Output showed 3 identical MASQUERADE rules
```

**Root Cause:**
- WireGuard was started multiple times without cleaning up
- Each start added another NAT rule
- Old rules weren't removed

**Solution:**
```bash
# Stop WireGuard (automatically removes rules via PostDown)
sudo wg-quick down wg0

# Verify old rules are gone
sudo iptables -t nat -L -n -v | grep MASQUERADE

# Start fresh
sudo wg-quick up wg0

# Save correct state
sudo netfilter-persistent save
```

**Prevention:**
- Always use `wg-quick down` before `wg-quick up`
- Never manually start the interface without the wrapper script

---

### Problem 3: Initial Ping Failures

**Issue:**
```powershell
PS> ping 192.168.90.10
Request timed out.
```

**Troubleshooting Steps:**
1. **Checked VPN connection:**
   ```bash
   sudo wg show
   # No handshake shown = client not connecting
   ```

2. **Verified client configuration:**
   - Endpoint was correct (160.191.150.171:51820)
   - AllowedIPs included 192.168.90.0/27
   
3. **Checked security group:**
   - Port 51820/UDP was open
   - ICMP was initially blocked

**Root Cause:**
- ICMP (ping) was blocked in security group
- VM 192.168.90.10 didn't exist yet

**Solution:**
1. Added ICMP rule to security group
2. Created test VM with IP 192.168.90.10
3. Waited for VPN handshake to establish
4. Ping started working:
   ```
   Reply from 192.168.90.10: bytes=32 time=9ms TTL=63
   ```

---

### Problem 4: Security Group Configuration

**Issue:**
Initially opened all ports for testing, which is insecure.

**Initial Configuration (Insecure):**
```
All TCP ports: 1-65535
All UDP ports: 1-65535
All ICMP
```

**Final Configuration (Secure):**
```
TCP 22:   SSH (limited to admin IPs in production)
UDP 51820: WireGuard only
ICMP:     Optional (can disable after testing)
```

**Lesson Learned:**
- Start with minimal required ports
- Add rules only as needed
- Document each rule's purpose

---

### Problem 5: SSH Password Authentication

**Issue:**
Enabled password authentication for convenience, then realized security risk.

**What Was Done:**
```bash
# Enabled password auth
sudo nano /etc/ssh/sshd_config.d/50-cloud-init.conf
# Set: PasswordAuthentication yes

# Set password
sudo passwd ubuntu

# Could now SSH with password
ssh ubuntu@160.191.150.171
```

**Security Fix:**
```bash
# Disable password authentication
sudo nano /etc/ssh/sshd_config.d/50-cloud-init.conf
# Set: PasswordAuthentication no

# Remove password
sudo passwd -d ubuntu

# Restart SSH
sudo systemctl restart sshd
```

**Final State:**
- SSH only works with key pair (wireguard-server.pem)
- Password authentication disabled
- More secure configuration

---

## 9. Testing & Verification

### Test 1: VPN Connection Test

**From Windows Client:**
```powershell
# Activate WireGuard tunnel
# Then test ping to VPN server
PS> ping 10.0.0.1

Pinging 10.0.0.1 with 32 bytes of data:
Reply from 10.0.0.1: bytes=32 time=8ms TTL=64
```

**✅ Result: SUCCESS**

---

### Test 2: Private VM Access Test

**Setup:**
1. Created test VM in private network
2. Assigned IP: 192.168.90.10
3. Connected via VPN

**From Windows Client:**
```powershell
PS> ping 192.168.90.10

Pinging 192.168.90.10 with 32 bytes of data:
Reply from 192.168.90.10: bytes=32 time=359ms TTL=63
Reply from 192.168.90.10: bytes=32 time=149ms TTL=63
Reply from 192.168.90.10: bytes=32 time=93ms TTL=63
Reply from 192.168.90.10: bytes=32 time=9ms TTL=63
```

**✅ Result: SUCCESS**
*Note: Initial high latency is normal due to ARP resolution*

---

### Test 3: SSH Through VPN

**From Windows Client (with VPN active):**
```powershell
# SSH directly to private VM using internal IP
PS> ssh ubuntu@192.168.90.10

# Successfully connected to private VM
ubuntu@test-vm:~$
```

**✅ Result: SUCCESS**

---

### Test 4: WireGuard Server Access

**From Windows Client:**
```powershell
# Ping WireGuard server's private IP
PS> ping 192.168.90.20

Reply from 192.168.90.20: bytes=32 time=8ms TTL=64
Reply from 192.168.90.20: bytes=32 time=13ms TTL=64
```

**SSH to WireGuard Server:**
```powershell
PS> ssh ubuntu@192.168.90.20
# Successfully connected
```

**✅ Result: SUCCESS**

---

### Test 4: Server-Side Verification

**On WireGuard Server:**
```bash
# Check active connections
sudo wg show

# Expected output:
interface: wg0
  public key: WFFZlfG9f+j41Y7QUUARKh1lnzzjFA/eOjVevERVUFY=
  private key: (hidden)
  listening port: 51820

peer: rlF4kCtppP75tpIFsRHTEAimYeVYrFOY6qHO3GOtq2Y=
  allowed ips: 10.0.0.2/32
  latest handshake: 45 seconds ago    # ✅ Active connection
  transfer: 15.2 KiB received, 18.7 KiB sent
```

**Check NAT translations:**
```bash
sudo iptables -t nat -L -n -v | grep MASQUERADE

# Shows packet counts (when client is active)
pkts bytes target     prot opt in     out     source         destination
  42  3360 MASQUERADE  0    --  *      ens3    10.0.0.0/24    192.168.90.0/27
```

---

## 10. Adding Additional Clients

### Process Overview

```
1. Generate client keys on server
2. Add peer configuration to server
3. Restart WireGuard
4. Create client configuration file
5. Import on client device
6. Test connectivity
```

### Step-by-Step Guide

#### For Client #2 (Example: client-102)

**1. Generate Keys on Server:**
```bash
ssh -i wireguard-server.pem ubuntu@160.191.150.171
sudo bash
cd /etc/wireguard

# Generate keys
wg genkey | tee client-102_private.key | wg pubkey > client-102_public.key

# View and save keys
cat client-102_private.key  # Save this for client config
cat client-102_public.key   # Add to server config
```

**2. Add to Server Configuration:**
```bash
nano /etc/wireguard/wg0.conf
```

**Add peer section:**
```ini
# Peer for client-102
[Peer]
PublicKey = <CLIENT-102_PUBLIC_KEY>
AllowedIPs = 10.0.0.3/32
```

**Complete example:**
```ini
[Interface]
Address = 10.0.0.1/24
ListenPort = 51820
PrivateKey = 8LMQBoynitujxfoyXPfih/XqV+uQN297AHLs+MQ3rHc=
PostUp = sysctl -w net.ipv4.ip_forward=1; iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -d 192.168.90.0/27 -o ens3 -j MASQUERADE; iptables -A FORWARD -i wg0 -o ens3 -d 192.168.90.0/27 -j ACCEPT; iptables -A FORWARD -i ens3 -o wg0 -s 192.168.90.0/27 -j ACCEPT
PostDown = sysctl -w net.ipv4.ip_forward=0; iptables -t nat -D POSTROUTING -s 10.0.0.0/24 -d 192.168.90.0/27 -o ens3 -j MASQUERADE; iptables -D FORWARD -i wg0 -o ens3 -d 192.168.90.0/27 -j ACCEPT; iptables -D FORWARD -i ens3 -o wg0 -s 192.168.90.0/27 -j ACCEPT

# Peer for client-101
[Peer]
PublicKey = rlF4kCtppP75tpIFsRHTEAimYeVYrFOY6qHO3GOtq2Y=
AllowedIPs = 10.0.0.2/32

# Peer for client-102
[Peer]
PublicKey = <CLIENT-102_PUBLIC_KEY>
AllowedIPs = 10.0.0.3/32
```

**3. Restart WireGuard:**
```bash
sudo wg-quick down wg0
sudo wg-quick up wg0

# Verify new peer
sudo wg show
```

**4. Create Client Configuration:**

**File: client-102.conf**
```ini
[Interface]
PrivateKey = <CLIENT-102_PRIVATE_KEY>
Address = 10.0.0.3/32
DNS = 1.1.1.1

[Peer]
PublicKey = WFFZlfG9f+j41Y7QUUARKh1lnzzjFA/eOjVevERVUFY=
Endpoint = 160.191.150.171:51820
AllowedIPs = 10.0.0.0/24, 192.168.90.0/27
PersistentKeepalive = 25
```

**5. Import on Client Device and Test**

---

### Client IP Assignment Reference

| Client ID | VPN IP | Status | Device Type |
|-----------|--------|--------|-------------|
| client-101 | 10.0.0.2 | Active | Windows |
| client-102 | 10.0.0.3 | Reserved | Linux |
| client-103 | 10.0.0.4 | Available | - |
| client-104 | 10.0.0.5 | Available | - |
| ... | ... | Available | - |
| client-254 | 10.0.0.254 | Available | - |

---

## 11. Security Hardening

### Implemented Security Measures

#### 1. SSH Key-Only Authentication
```bash
# /etc/ssh/sshd_config.d/50-cloud-init.conf
PasswordAuthentication no
PubkeyAuthentication yes
PermitRootLogin no
```

#### 2. Minimal Port Exposure
```
Open Ports:
- 22/tcp:   SSH (consider IP whitelisting)
- 51820/udp: WireGuard only
```

#### 3. WireGuard Key Security
```bash
# All keys stored with restrictive permissions
chmod 600 /etc/wireguard/*.key
chmod 600 /etc/wireguard/wg0.conf
```

#### 4. Firewall Rules
```bash
# Only necessary traffic allowed
iptables rules: Accept SSH, WireGuard, and established connections only
```

---

### Additional Security Recommendations

#### 1. SSH Hardening
```bash
sudo nano /etc/ssh/sshd_config

# Add these lines:
ClientAliveInterval 300
ClientAliveCountMax 2
MaxAuthTries 3
MaxSessions 2
```

#### 2. Fail2Ban Installation
```bash
sudo apt install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
```

#### 3. Automatic Security Updates
```bash
sudo apt install unattended-upgrades -y
sudo dpkg-reconfigure --priority=low unattended-upgrades
```

#### 4. Restrict SSH Access by IP
```bash
# In security group or iptables:
iptables -A INPUT -p tcp --dport 22 -s YOUR_ADMIN_IP/32 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j DROP
```

#### 5. Regular Key Rotation
```
Schedule: Every 90 days
- Generate new server keys
- Update all client configurations
- Revoke old keys
```

#### 6. Monitoring and Logging
```bash
# Monitor WireGuard connections
sudo journalctl -u wg-quick@wg0 -f

# Monitor authentication attempts
sudo tail -f /var/log/auth.log
```

---

## 12. Maintenance & Monitoring

### Daily Monitoring Commands

```bash
# Check WireGuard status
sudo wg show

# Check active connections
sudo wg show wg0

# View recent logs
sudo journalctl -u wg-quick@wg0 --since "1 hour ago"

# Check system resources
htop
df -h
free -h
```

---

### Weekly Maintenance Tasks

```bash
# 1. Update system packages
sudo apt update && sudo apt upgrade -y

# 2. Check for security updates
sudo apt list --upgradable | grep -i security

# 3. Review firewall rules
sudo iptables -L -n -v

# 4. Check disk usage
df -h

# 5. Review authentication logs
sudo grep -i "failed" /var/log/auth.log | tail -20
```

---

### Monthly Maintenance Tasks

```bash
# 1. Full system upgrade
sudo apt update && sudo apt full-upgrade -y

# 2. Clean up old packages
sudo apt autoremove -y
sudo apt autoclean

# 3. Verify backup configurations
ls -lh /etc/wireguard/

# 4. Test client connections
# Have users test VPN connectivity

# 5. Review access logs
sudo journalctl -u wg-quick@wg0 --since "30 days ago" | grep -i "error\|fail"
```

---

### Backup Procedures

#### Backup WireGuard Configuration

```bash
# Create backup directory
sudo mkdir -p /root/wireguard-backups

# Backup all WireGuard files
sudo tar -czf /root/wireguard-backups/wireguard-backup-$(date +%Y%m%d).tar.gz \
    /etc/wireguard/

# Copy to remote location (recommended)
scp /root/wireguard-backups/wireguard-backup-*.tar.gz \
    user@backup-server:/path/to/backups/
```

#### Restore from Backup

```bash
# Stop WireGuard
sudo wg-quick down wg0

# Extract backup
sudo tar -xzf /root/wireguard-backups/wireguard-backup-YYYYMMDD.tar.gz -C /

# Start WireGuard
sudo wg-quick up wg0
```

---

### Performance Monitoring

#### Check VPN Throughput

```bash
# On server, install iperf3
sudo apt install iperf3 -y

# Start server mode
iperf3 -s

# On client (through VPN)
iperf3 -c 10.0.0.1
```

#### Check Connection Statistics

```bash
# Detailed peer information
sudo wg show wg0

# Shows:
# - Latest handshake time
# - Data transfer (received/sent)
# - Endpoint IP
```

---

## 13. Troubleshooting Guide

### Issue 1: Cannot Connect to VPN

**Symptoms:**
- Client shows "connecting" but never connects
- No handshake shown in `wg show`

**Diagnosis:**
```bash
# On server, check if WireGuard is running
sudo systemctl status wg-quick@wg0

# Check if port is listening
sudo ss -ulnp | grep 51820

# Check firewall
sudo iptables -L -n | grep 51820
```

**Solutions:**
1. Verify WireGuard is running: `sudo wg-quick up wg0`
2. Check security group allows UDP 51820
3. Verify client endpoint IP is correct (160.191.150.171)
4. Check for NAT/firewall between client and server

---

### Issue 2: Can Connect to VPN but Cannot Access Private VMs

**Symptoms:**
- Can ping 10.0.0.1 (VPN server)
- Cannot ping 192.168.90.x (private VMs)

**Diagnosis:**
```bash
# Check routing
ip route show

# Check NAT rules
sudo iptables -t nat -L -n -v

# Check forwarding
cat /proc/sys/net/ipv4/ip_forward  # Should be 1

# Check forward rules
sudo iptables -L FORWARD -n -v
```

**Solutions:**
```bash
# Enable IP forwarding
sudo sysctl -w net.ipv4.ip_forward=1

# Add NAT rule if missing
sudo iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -d 192.168.90.0/27 -o ens3 -j MASQUERADE

# Add forwarding rules
sudo iptables -A FORWARD -i wg0 -o ens3 -d 192.168.90.0/27 -j ACCEPT
sudo iptables -A FORWARD -i ens3 -o wg0 -s 192.168.90.0/27 -j ACCEPT

# Save rules
sudo netfilter-persistent save

# Restart WireGuard
sudo wg-quick down wg0 && sudo wg-quick up wg0
```

---

### Issue 3: Connection Drops After Period of Inactivity

**Symptoms:**
- VPN works initially
- Stops working after no activity
- Requires reconnection

**Diagnosis:**
```bash
# Check client configuration
cat /etc/wireguard/client-101.conf | grep Keepalive
```

**Solution:**
Add keepalive to client configuration:
```ini
[Peer]
PublicKey = <SERVER_PUBLIC_KEY>
Endpoint = 160.191.150.171:51820
AllowedIPs = 10.0.0.0/24, 192.168.90.0/27
PersistentKeepalive = 25    # ← Add this line
```

---

### Issue 4: High Latency or Packet Loss

**Symptoms:**
- High ping times
- Intermittent connectivity

**Diagnosis:**
```bash
# Test direct ping to server public IP
ping 160.191.150.171

# Test through VPN
ping 10.0.0.1

# Check server load
top
```

**Solutions:**
1. Check internet connection quality
2. Verify server is not overloaded
3. Consider upgrading server resources
4. Check MTU settings:
   ```bash
   # On client
   ip link show wg0  # Check current MTU
   
   # Try lower MTU in client config
   [Interface]
   MTU = 1420
   ```

---

### Issue 5: Multiple Clients Cannot Connect

**Symptoms:**
- First client works fine
- Additional clients fail

**Diagnosis:**
```bash
# Check peer configuration
sudo wg show wg0

# Verify no duplicate IPs
cat /etc/wireguard/wg0.conf | grep AllowedIPs
```

**Solution:**
Ensure each client has unique IP:
```ini
[Peer]  # Client 1
AllowedIPs = 10.0.0.2/32

[Peer]  # Client 2
AllowedIPs = 10.0.0.3/32  # ← Must be different

[Peer]  # Client 3
AllowedIPs = 10.0.0.4/32  # ← Must be different
```

---

### Issue 6: WireGuard Won't Start After Reboot

**Symptoms:**
- Server reboots
- WireGuard doesn't auto-start
- Must manually run `wg-quick up wg0`

**Diagnosis:**
```bash
sudo systemctl status wg-quick@wg0
```

**Solution:**
```bash
# Enable auto-start
sudo systemctl enable wg-quick@wg0

# Verify
sudo systemctl is-enabled wg-quick@wg0
# Should output: enabled
```

---

### Issue 7: Cannot SSH to WireGuard Server

**Symptoms:**
- Connection timeout
- Connection refused

**Diagnosis:**
```bash
# Check if SSH is running
sudo systemctl status sshd

# Check if port 22 is listening
sudo ss -tlnp | grep :22

# Check firewall
sudo iptables -L INPUT -n | grep 22
```

**Solutions:**
```bash
# Start SSH if not running
sudo systemctl start sshd
sudo systemctl enable sshd

# Add firewall rule if missing
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo netfilter-persistent save
```

---

### Emergency Access

If locked out of server:

1. **Via Pico Cloud Console:**
   - Login to Pico Cloud portal
   - Navigate to Compute → Instances
   - Click on "wireguard" instance
   - Use "Console" tab to access

2. **Via VNC/Console:**
   - Login with Ubuntu user
   - Fix configuration
   - Restart services

3. **Recovery Mode:**
   - If WireGuard blocks connectivity, use Pico console:
   ```bash
   sudo wg-quick down wg0
   # Fix issue
   sudo wg-quick up wg0
   ```

---

## Summary

### What We Built

A production-grade **WireGuard VPN gateway** that:
- ✅ Runs on Pico Public Cloud (OpenStack)
- ✅ Provides secure remote access to private VMs
- ✅ Uses industry-standard encryption (WireGuard)
- ✅ Supports multiple concurrent clients
- ✅ Has proper NAT and routing configuration
- ✅ Includes security hardening
- ✅ Auto-starts on boot
- ✅ Has proper monitoring and backup procedures

### Key Achievements

1. **Successful Deployment**
   - Server configured and operational
   - First client (client-101) successfully connected
   - Private VM access confirmed (192.168.90.10)

2. **Security Implementation**
   - SSH key-only authentication
   - Minimal port exposure
   - Proper file permissions
   - Documented security hardening

3. **Documentation**
   - Complete architecture diagrams
   - Step-by-step installation guide
   - Troubleshooting procedures
   - Maintenance schedules

### Next Steps

1. **Add More Clients**
   - Follow the client addition process in Section 10
   - Maintain IP address assignment table
   - Test each new client thoroughly

2. **Implement Monitoring**
   - Setup automated health checks
   - Configure alerting for connection issues
   - Log rotation and retention

3. **Regular Maintenance**
   - Follow weekly/monthly maintenance schedules
   - Keep backups up to date
   - Review security logs regularly

4. **Consider Scaling**
   - Monitor server resource usage
   - Plan for additional capacity if needed
   - Consider high availability setup

---

## Appendix

### Quick Reference Commands

```bash
# Start WireGuard
sudo wg-quick up wg0

# Stop WireGuard
sudo wg-quick down wg0

# Restart WireGuard
sudo wg-quick down wg0 && sudo wg-quick up wg0

# Check status
sudo wg show

# View logs
sudo journalctl -u wg-quick@wg0 -f

# Check connections
sudo wg show wg0

# Test connectivity
ping 10.0.0.1  # VPN server
ping 192.168.90.20  # WireGuard server LAN IP
```

### Important File Locations

```
/etc/wireguard/wg0.conf               # Main configuration
/etc/wireguard/server_private.key      # Server private key
/etc/wireguard/server_public.key       # Server public key
/etc/wireguard/client-*_private.key    # Client private keys
/etc/wireguard/client-*_public.key     # Client public keys
/etc/sysctl.conf                       # IP forwarding configuration
/var/log/syslog                        # System logs
```
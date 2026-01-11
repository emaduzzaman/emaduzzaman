# WireGuard VPN Gateway on OpenStack Cloud - PICO Public Cloud

A production-grade WireGuard VPN gateway implementation on OpenStack (Pico Public Cloud) that provides secure remote access to private cloud infrastructure.

---

## What This Project Does

### For Non-Technical Users
This project creates a **secure virtual door** to your private cloud servers. Instead of exposing every server to the internet (which is risky and expensive), you set up one secure gateway. Remote users connect to this gateway through an encrypted tunnel, and then they can access all your private servers safely as if they were sitting in your office.

**Real-World Example:**  
Imagine you have 10 servers in the cloud that need to stay private. Instead of paying for 10 public IP addresses and managing 10 different security setups, you create one secure VPN server. Your team can connect to this VPN from anywhere in the world and access all 10 servers securely.

### For Technical Users
Implementation of a **Layer 3 WireGuard VPN gateway** on OpenStack infrastructure that establishes an encrypted tunnel (Curve25519, ChaCha20-Poly1305) enabling cryptographically authenticated remote clients to access RFC1918 private network segments (192.168.90.0/27) via a centralized NAT gateway. The solution uses iptables MASQUERADE for network address translation and policy-based routing for bidirectional traffic flow between VPN overlay (10.0.0.0/24) and private cloud network.

**Architecture:**  
Point-to-Site VPN topology with stateless cryptokey routing, zero-trust authentication model, and kernel-space implementation for near line-rate throughput performance.

---

## Architecture Overview

```
Internet → WireGuard Gateway (160.191.150.171:51820/UDP)
              ↓
         NAT + Routing
              ↓
    Private Cloud Network (192.168.90.0/27)
              ↓
         VMs without public IPs
```

**Key Components:**
- **Public Endpoint:** Single floating IP for VPN connections
- **VPN Network:** 10.0.0.0/24 overlay for client addressing
- **Private Network:** 192.168.90.0/27 isolated backend network
- **NAT Gateway:** iptables-based MASQUERADE for routing

---

## Key Features

-  **End-to-End Encryption** - ChaCha20-Poly1305 authenticated encryption
-  **Public Key Authentication** - Ed25519 cryptographic keys, no passwords
-  **Cross-Platform** - Windows, macOS, Linux, Android, iOS clients
-  **NAT Traversal** - Works behind firewalls and NAT devices
-  **Connection Roaming** - Maintains connection during IP changes
-  **Scalable** - Supports 250+ concurrent peer connections
-  **Cost Efficient** - Single public IP for entire infrastructure

---

## Repository Structure

```
wireguard-vpn-gateway-openstack/
├── README.md                                                               # This file – main project overview
├── snaps-vm_creation-OpenStack-PICO-Cloud/                                 # VM creation and setup screenshots - OpenStack (PICO Public Cloud)
├── cli-wireguard.txt                                                       # Complete terminal session logs showing how WireGuard was configured
├── project-documentation.md                                                # Comprehensive technical documentation
└── configuration-files/                                                    # All WireGuard configuration reference files
    ├── README.md                                                           # Entry point for configuration files documentation
    ├── server-configuration-files.md                                       # Server-side WireGuard configuration and tuning
    ├── client-configuration-files.md                                       # Client-side WireGuard configuration
    ├── firewall-configuration-files.md                                     # Firewall (iptables/ufw) rules for WireGuard VPN
    ├── system-configuration-files.md                                       # System-level settings 
    └── helper-scripts.md                                                   # Helper and automation scripts for WireGuard management


```
---

## Documentation

- **[Complete Documentation](project-documentation.md)** - Full technical guide with architecture diagrams, troubleshooting, and maintenance procedures
- **[CLI Session Log](cli-wireguard.txt)** - Actual terminal used during setup
- **[Configuration Files](configuraiton-files/)** - All config files with detailed comments


## Technical Specifications

| Component | Specification |
|-----------|---------------|
| **Platform** | Pico Public Cloud (OpenStack) |
| **OS** | Ubuntu Server 24.04.2 LTS |
| **Kernel** | 6.8.0-88-generic |
| **WireGuard** | 1.0.20210914 (in-kernel) |
| **Compute** | 1 vCPU, 2GB RAM, 20GB NVMe |
| **Public IP** | 160.191.150.171 (floating IP) |
| **VPN Network** | 10.0.0.0/24 (overlay) |
| **Private Network** | 192.168.90.0/27 (RFC1918) |
| **Protocol** | UDP port 51820 |
| **Encryption** | ChaCha20-Poly1305 |
| **Key Exchange** | Curve25519 |
| **Authentication** | Ed25519 signatures |


## Security Features

- **Modern Cryptography** - State-of-the-art cryptographic primitives
- **Perfect Forward Secrecy** - Session keys rotated automatically
- **Minimal Attack Surface** - Only 2 ports exposed (SSH: 22/tcp, WireGuard: 51820/udp)
- **SSH Key Authentication** - No password-based access
- **Network Isolation** - Private VMs completely isolated from internet
- **Allowlist Authorization** - Per-peer IP assignment and access control
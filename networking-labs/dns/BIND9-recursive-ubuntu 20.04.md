emaduzzaman/
├── cloud-engine/
│   ├── SAA-C03/
│   └── cloud-init/
│       ├── cloud-image-utils/
│       ├── template-creation (ubuntu-24.04) _on proxmox-VE/
│       └── userdata-scripts/
├── full-projects/
│   ├── dns_web-applicaiton_mail_server_openstack-environment/
│   │   ├── terminal-logs/
│   │   └── test_result/
│   ├── home-lab/
│   │   └── project-1/
│   │       ├── lab-1/
│   │       ├── lab-10/
│   │       ├── lab-11/
│   │       ├── lab-15/
│   │       ├── lab-20/
│   │       └── main-enviroment/
│   ├── nextcloud-openstack-pico/
│   │   └── screenshort/
│   └── ownCloud-openstack/
├── networking-labs/
│   ├── ccna-200-301/
│   │   ├── configurations/
│   │   ├── module-exam-solutions/
│   │   ├── packet-tracker-practice-files/
│   │   └── solution-guides&assignements/
│   ├── dns/
│   ├── load-balancer/
│   │   └── Load-Balancing-on-openstack-AmphoraV2/
│   ├── vpn/
│   │   ├── packet-tracer-ipsec-topology-config/
│   │   └── wireguard-vpn-gateway-openstack/
│   │       ├── configuraiton-files/
│   │       └── snaps-vm_creation-OpenStack-PICO-Cloud/
│   └── waf/
├── penguin-scripts/
│   ├── mac-automation/
│   ├── network-config---automation/
│   │   ├── automated-static-ip-101/
│   │   └── network_diagnosis-101/
│   ├── system-config---automation/
│   │   └── full-applicaiton-cleaner/
│   ├── user-management/
│   └── volume-management/
├── penguin-system_configuration/
│   ├── EX200/
│   ├── configuring-a-static-ip-address-with-netplan-on-ubuntu/
│   ├── setting-static-ip-on-ubuntu_VM/
│   ├── ubuntu-XFCE-Desktop+XRDP-setup/
│   └── ubuntu-dpkg-interrupted-recovery/
├── snake-scripts/
└── wincore-systems/
    └── default-rdp-port-change/
        └── ss/# BIND9 Recursive DNS Server on Ubuntu 20.04

## Table of Contents

- [Overview](#overview)
  - [Environment Specifications](#environment-specifications)
- [Architecture](#architecture)
  - [DNS Resolution Flow](#dns-resolution-flow)
- [Prerequisites](#prerequisites)
  - [System Requirements](#system-requirements)
  - [Network Requirements](#network-requirements)
- [Installation](#installation)
  - [Step 1: Update System Packages](#step-1-update-system-packages)
  - [Step 2: Install BIND9 and Related Packages](#step-2-install-bind9-and-related-packages)
  - [Step 3: Verify Installation](#step-3-verify-installation)
  - [Step 4: Check Service Status](#step-4-check-service-status)
- [BIND9 Directory Structure](#bind9-directory-structure)
  - [Configuration Directory: /etc/bind/](#configuration-directory-etcbind)
  - [Cache Directory: /var/cache/bind/](#cache-directory-varcachebind)
  - [Root Hints File](#root-hints-file)
- [Configuration Files](#configuration-files)
  - [named.conf](#file-1-etcbindnamedconf)
  - [named.conf.options](#file-2-etcbindnamedconfoptions)
  - [named.conf.local](#file-3-etcbindnamedconflocal)
  - [named.conf.default-zones](#file-4-etcbindnamedconfdefault-zones)
- [Step-by-Step Configuration](#step-by-step-configuration)
  - [Set Permanent Hostname](#step-1-set-permanent-hostname)
  - [Update /etc/hosts](#step-2-update-etchosts)
  - [Backup Original Configuration](#step-3-backup-original-configuration)
  - [Configure named.conf.options](#step-4-configure-namedconfoptions)
  - [Verify Root Hints File](#step-5-verify-root-hints-file)
  - [Verify named.conf.default-zones](#step-6-verify-namedconfdefault-zones)
  - [Configure named.conf.local](#step-7-configure-namedconflocal)
  - [Fix AppArmor Permissions](#step-8-fix-apparmor-permissions-optional)
  - [Validate Configuration](#step-9-validate-configuration)
  - [Restart and Enable BIND9](#step-10-restart-and-enable-bind9)
  - [Verify Port 53 is Listening](#step-11-verify-port-53-is-listening)
  - [Test Local Resolution](#step-12-test-local-resolution)
- [Client Configuration](#client-configuration)
  - [Configure Ubuntu Client to Use DNS Server](#configure-ubuntu-client-to-use-dns-server)
- [Testing and Verification](#testing-and-verification)
  - [Basic DNS Resolution](#test-1-basic-dns-resolution)
  - [Test from Client Machine](#test-2-test-from-client-machine)
  - [DNSSEC Validation](#test-3-dnssec-validation)
  - [Trace DNS Query Path](#test-4-trace-dns-query-path)
  - [Check Query Statistics](#test-5-check-query-statistics)
  - [Verify Cache](#test-6-verify-cache)
  - [Check BIND Logs](#test-7-check-bind-logs)
- [Troubleshooting](#troubleshooting)
  - [BIND Service Not Starting](#issue-1-bind-service-not-starting)
  - [Configuration Syntax Errors](#issue-2-configuration-syntax-errors)
  - [DNS Queries Not Resolving](#issue-3-dns-queries-not-resolving)
  - [Root Hints File Missing](#issue-4-root-hints-file-missing)
  - [Permission Denied Errors](#issue-5-permission-denied-errors)
  - [DNSSEC Validation Failures](#issue-6-dnssec-validation-failures)
  - [High Memory Usage](#issue-7-high-memory-usage)
  - [Client Not Using DNS Server](#issue-8-client-not-using-dns-server)

---

## Overview

This project demonstrates setting up a recursive DNS resolver using BIND9 on Ubuntu 20.04. The DNS server performs recursive lookups by querying root servers directly, enabling full DNS resolution without relying on external forwarders.

### Environment Specifications

- **Operating System**: Ubuntu 20.04 LTS Server
- **DNS Software**: BIND9 (Berkeley Internet Name Domain)
- **Server IP**: 192.168.10.148/24
- **Server Hostname**: emaduzzaman-dns
- **Network**: 192.168.10.0/24

---

## Architecture

```
                    Client Machine
                         |
                         | DNS Query (Port 53)
                         |
                         v
              ┌─────────────────────────────┐
              │   BIND9 DNS Server          │
              │   IP: 192.168.10.148        │
              │   Port: 53 (UDP/TCP)        │
              │   Hostname: emaduzzaman-dns │
              └──────────┬──────────────────┘
                         |
                         | Recursive Query
                         |
              ┌──────────┴──────────────┐
              |                         |
              v                         v
    ┌─────────────────┐      ┌──────────────────┐
    │  Root Servers   │      │  TLD Servers     │
    │  (.)            │ ───> │  (.com, .org)    │
    └─────────────────┘      └──────────┬───────┘
                                        |
                                        v
                             ┌──────────────────┐
                             │ Authoritative NS │
                             │ (google.com DNS) │
                             └──────────────────┘
```

### DNS Resolution Flow

1. Client sends DNS query to BIND9 server (192.168.10.148)
2. BIND9 checks local cache
3. If not cached, queries root servers
4. Root servers respond with TLD server addresses
5. BIND9 queries TLD servers
6. TLD servers respond with authoritative nameserver
7. BIND9 queries authoritative nameserver
8. Final answer cached and returned to client

---

## Prerequisites

### System Requirements

- Ubuntu 20.04 LTS Server
- 1 CPU core
- 1 GB RAM
- 20 GB disk space
- Static IP address configured
- Root or sudo access
- Network connectivity

### Network Requirements

- Static IP address assigned
- Port 53 (UDP/TCP) accessible
- Internet connectivity for package installation

---

## Installation

### Step 1: Update System Packages

```bash
sudo apt update
sudo apt upgrade -y
```

### Step 2: Install BIND9 and Related Packages

```bash
sudo apt install bind9 bind9-utils bind9-dnsutils bind9-host bind9-doc -y
```

**Package Explanation:**

- `bind9`: Main DNS server daemon
- `bind9-utils`: Utilities like named-checkconf, named-checkzone
- `bind9-dnsutils`: DNS query tools (dig, nslookup, host)
- `bind9-host`: DNS lookup utility
- `bind9-doc`: Documentation files

### Step 3: Verify Installation

```bash
sudo apt list --installed | grep bind9
```

**Expected Output:**

```
bind9/focal-updates,now 1:9.16.x-x installed
bind9-dnsutils/focal-updates,now 1:9.16.x-x installed
bind9-host/focal-updates,now 1:9.16.x-x installed
bind9-utils/focal-updates,now 1:9.16.x-x installed
```

### Step 4: Check Service Status

```bash
sudo systemctl status bind9
```

**Note:** On Ubuntu 20.04, the service name is `bind9`. On Ubuntu 22.04+, it's `named`.

---

## BIND9 Directory Structure

### Configuration Directory: /etc/bind/

```
/etc/bind/
├── named.conf                    # Main configuration file (includes others)
├── named.conf.options            # Global BIND options
├── named.conf.local              # Local zone definitions
├── named.conf.default-zones      # Default zones (localhost, root hints)
├── zones/                        # Directory for zone files (if any)
├── db.local                      # Localhost forward zone
├── db.127                        # Localhost reverse zone
├── db.0                          # Reverse zone for 0.0.0.0
├── db.255                        # Reverse zone for 255.255.255.255
└── rndc.key                      # Control key for rndc utility
```

### Cache Directory: /var/cache/bind/

This directory stores:
- Working files
- Journal files
- Managed-keys (DNSSEC trust anchors)
- Cache data (if configured)

### Root Hints File: /usr/share/dns/root.hints

Contains IP addresses of root DNS servers. Essential for recursive resolution.

---

## Configuration Files

### File 1: /etc/bind/named.conf

**Purpose:** Main configuration file that includes other configuration files.

**Location:** `/etc/bind/named.conf`

**Content:**

```bash
// This is the primary configuration file for the BIND DNS server named.
//
// Please read /usr/share/doc/bind9/README.Debian for information on the
// structure of BIND configuration files in Debian, *BEFORE* you customize
// this configuration file.
//
// If you are just adding zones, please do that in /etc/bind/named.conf.local

include "/etc/bind/named.conf.options";
include "/etc/bind/named.conf.local";
include "/etc/bind/named.conf.default-zones";
```

**Explanation:**

This file acts as the master configuration by including three key files:
1. `named.conf.options` - Global server options
2. `named.conf.local` - Custom zone definitions
3. `named.conf.default-zones` - Standard zones (localhost, root)

---

### File 2: /etc/bind/named.conf.options

**Purpose:** Contains global BIND server options including recursion, caching, DNSSEC, and network settings.

**Location:** `/etc/bind/named.conf.options`

**Content:**

```bash
options {
    directory "/var/cache/bind";

    // Allow queries from your internal subnet
    allow-query { 192.168.10.0/24; localhost; };

    // Enable recursion
    recursion yes;

    // Forwarders: (empty for full recursion)
    forwarders { };

    // Listen on your interface and localhost
    listen-on { 127.0.0.1; 192.168.10.148; };
    listen-on-v6 { none; };

    dnssec-validation auto;
    auth-nxdomain no;
};
```

**Explanation:**

- `directory`: Working directory for BIND
- `allow-query`: Restricts who can query the server (security)
- `recursion yes`: Enables recursive DNS resolution
- `forwarders { }`: Empty means query root servers directly (no forwarding)
- `listen-on`: IP addresses to listen on (localhost + server IP)
- `listen-on-v6`: Disable IPv6 (or set to `any` for IPv6 support)
- `dnssec-validation auto`: Enable DNSSEC validation automatically
- `auth-nxdomain no`: RFC-compliant behavior for non-existent domains

**Alternative Configuration (More Secure/Optimized):**

```bash
options {
    directory "/var/cache/bind";

    // Allow queries from everywhere (restrict in production)
    recursion yes;
    allow-query { any; };
    allow-recursion { any; };

    // Disable forwarding (full recursive resolver)
    forwarders { };

    // Enable DNSSEC validation
    dnssec-validation auto;

    // Listen on all network interfaces
    listen-on { any; };
    listen-on-v6 { any; };

    // Enable response rate limiting (DDoS protection)
    rate-limit {
        responses-per-second 15;
    };

    // Cache optimization
    max-cache-size 256M;
    minimal-responses yes;

    // Server version (security through obscurity)
    version "emaduzzaman-dns resolver";

    // Root delegation
    root-delegation-only exclude { "localhost"; "localdomain"; };
};
```

---

### File 3: /etc/bind/named.conf.local

**Purpose:** Defines local/custom authoritative zones. For pure recursive resolver, this file is mostly empty.

**Location:** `/etc/bind/named.conf.local`

**Content:**

```bash
// No local zones – pure recursive resolver
// Do any local configuration here
//

// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";
```

**Optional - Adding Local Authoritative Zone:**

If you want to serve a local domain (e.g., `openstack.internal`):

```bash
zone "openstack.internal" {
    type master;
    file "/etc/bind/zones/db.openstack.internal";
};
```

**Explanation:**

- For a pure recursive resolver, this file remains empty
- Add zones here only if hosting authoritative zones
- Example shows how to add internal domain zones

---

### File 4: /etc/bind/named.conf.default-zones

**Purpose:** Defines default zones including root hints and localhost zones.

**Location:** `/etc/bind/named.conf.default-zones`

**Content:**

```bash
// prime the server with knowledge of the root servers
zone "." {
        type hint;
        file "/usr/share/dns/root.hints";
};

// be authoritative for the localhost forward and reverse zones, and for
// broadcast zones as per RFC 1912

zone "localhost" {
        type master;
        file "/etc/bind/db.local";
};

zone "127.in-addr.arpa" {
        type master;
        file "/etc/bind/db.127";
};

zone "0.in-addr.arpa" {
        type master;
        file "/etc/bind/db.0";
};

zone "255.in-addr.arpa" {
        type master;
        file "/etc/bind/db.255";
};
```

**Explanation:**

- **Root zone (.)**: References root.hints file for root server IPs
- **localhost zone**: Handles localhost forward resolution
- **127.in-addr.arpa**: Handles localhost reverse resolution (127.0.0.1)
- **0.in-addr.arpa**: Reverse zone for 0.0.0.0
- **255.in-addr.arpa**: Reverse zone for 255.255.255.255

---

## Step-by-Step Configuration

### Step 1: Set Permanent Hostname

```bash
sudo hostnamectl set-hostname emaduzzaman-dns
```

**Verify:**

```bash
hostnamectl
```

**Expected Output:**

```
Static hostname: emaduzzaman-dns
```

### Step 2: Update /etc/hosts

```bash
sudo nano /etc/hosts
```

**Add/Modify:**

```
127.0.0.1       localhost
192.168.10.148  emaduzzaman-dns
```

**Save and exit** (Ctrl+O, Enter, Ctrl+X)

### Step 3: Backup Original Configuration

```bash
sudo cp /etc/bind/named.conf.options /etc/bind/named.conf.options.backup
sudo cp /etc/bind/named.conf.local /etc/bind/named.conf.local.backup
```

### Step 4: Configure named.conf.options

```bash
sudo nano /etc/bind/named.conf.options
```

**Delete everything and paste:**

```bash
options {
    directory "/var/cache/bind";

    // Allow queries from your internal subnet
    allow-query { 192.168.10.0/24; localhost; };

    // Enable recursion
    recursion yes;

    // Forwarders: (empty for full recursion)
    forwarders { };

    // Listen on your interface and localhost
    listen-on { 127.0.0.1; 192.168.10.148; };
    listen-on-v6 { none; };

    dnssec-validation auto;
    auth-nxdomain no;
};
```

**Save and exit**

### Step 5: Verify Root Hints File

```bash
ls -l /usr/share/dns/root.hints
```

**If file doesn't exist, download it:**

```bash
sudo wget https://www.internic.net/domain/named.root -O /usr/share/dns/root.hints
```

### Step 6: Verify named.conf.default-zones

```bash
sudo nano /etc/bind/named.conf.default-zones
```

**Ensure this section exists:**

```bash
zone "." {
    type hint;
    file "/usr/share/dns/root.hints";
};
```

### Step 7: Configure named.conf.local

```bash
sudo nano /etc/bind/named.conf.local
```

**Content (for pure recursive resolver):**

```bash
// No local zones – pure recursive resolver
```

**Save and exit**

### Step 8: Fix AppArmor Permissions (Optional)

```bash
sudo apparmor_parser -r /etc/apparmor.d/usr.sbin.named
```

### Step 9: Validate Configuration

```bash
sudo named-checkconf
```

**No output means configuration is valid**

### Step 10: Restart and Enable BIND9

```bash
sudo systemctl restart bind9
sudo systemctl enable bind9
sudo systemctl status bind9
```

**Expected Output:**

```
● bind9.service - BIND Domain Name Server
   Loaded: loaded (/lib/systemd/system/bind9.service; enabled)
   Active: active (running)
```

### Step 11: Verify Port 53 is Listening

```bash
sudo ss -tulpn | grep named
```

**Expected Output:**

```
udp   UNCONN 0      0      192.168.10.148:53     0.0.0.0:*    users:(("named",pid=xxxx))
udp   UNCONN 0      0      127.0.0.1:53          0.0.0.0:*    users:(("named",pid=xxxx))
tcp   LISTEN 0      10     192.168.10.148:53     0.0.0.0:*    users:(("named",pid=xxxx))
tcp   LISTEN 0      10     127.0.0.1:53          0.0.0.0:*    users:(("named",pid=xxxx))
```

### Step 12: Test Local Resolution

```bash
dig @127.0.0.1 google.com
```

**Expected Output:** Should return Google's IP addresses with query time.

---

## Client Configuration

### Configure Ubuntu Client to Use DNS Server

These steps are performed on a client machine (Ubuntu 20.04) to use your DNS server.

### Step 1: Check Current DNS Configuration

```bash
resolvectl status
```

### Step 2: Configure DNS for Network Interface

**Replace `ens3` with your interface name (check with `ip a`):**

```bash
sudo resolvectl dns ens3 192.168.10.148
```

### Step 3: Set Search Domain (Optional)

```bash
sudo resolvectl domain ens3 picocloud.test
```

### Step 4: Restart systemd-resolved

```bash
sudo systemctl restart systemd-resolved
```

### Step 5: Verify Configuration

```bash
resolvectl status
```

**Expected Output:**

```
Link 2 (ens3)
    Current Scopes: DNS
         Protocols: +DefaultRoute +LLMNR -mDNS -DNSOverTLS DNSSEC=no/unsupported
Current DNS Server: 192.168.10.148
       DNS Servers: 192.168.10.148
        DNS Domain: picocloud.test
```

### Alternative: Using /etc/systemd/resolved.conf

```bash
sudo nano /etc/systemd/resolved.conf
```

**Add:**

```
[Resolve]
DNS=192.168.10.148
DNSStubListener=yes
```

**Restart:**

```bash
sudo systemctl restart systemd-resolved
```

---

## Testing and Verification

### Test 1: Basic DNS Resolution

```bash
dig @192.168.10.148 google.com
```

**Check for:**
- ANSWER SECTION with IP addresses
- Query time
- SERVER: 192.168.10.148

### Test 2: Test from Client Machine

```bash
dig google.com +short
dig ubuntu.com +short
dig cloudflare.com +short
```

### Test 3: DNSSEC Validation

```bash
dig +dnssec cloudflare.com @192.168.10.148
```

**Look for:** `ad` flag (authenticated data)

**Test DNSSEC failure:**

```bash
dig +dnssec dnssec-failed.org @192.168.10.148
```

**Expected:** SERVFAIL (indicates DNSSEC validation is working)

### Test 4: Trace DNS Query Path

```bash
dig +trace google.com @192.168.10.148
```

**Shows:** Complete recursive resolution path from root servers to authoritative nameservers

### Test 5: Check Query Statistics

```bash
sudo rndc stats
cat /var/cache/bind/named.stats
```

### Test 6: Verify Cache

```bash
# First query (slower - not cached)
time dig google.com @192.168.10.148

# Second query (faster - cached)
time dig google.com @192.168.10.148
```

### Test 7: Check BIND Logs

```bash
sudo tail -f /var/log/syslog | grep named
```

---

## Troubleshooting

### Issue 1: BIND Service Not Starting

**Check service status:**

```bash
sudo systemctl status bind9
```

**View detailed logs:**

```bash
sudo journalctl -u bind9 -xe
```

**Common causes:**

- Configuration syntax errors
- Port 53 already in use
- Permission issues

**Solution:**

```bash
# Check configuration
sudo named-checkconf

# Check if port is in use
sudo lsof -i :53

# Restart service
sudo systemctl restart bind9
```

### Issue 2: Configuration Syntax Errors

**Validate configuration:**

```bash
sudo named-checkconf
sudo named-checkconf /etc/bind/named.conf.options
```

**Check zone files:**

```bash
sudo named-checkzone localhost /etc/bind/db.local
```

### Issue 3: DNS Queries Not Resolving

**Check if BIND is listening:**

```bash
sudo ss -tulpn | grep :53
```

**Test direct query:**

```bash
dig @127.0.0.1 google.com
```

**Check firewall:**

```bash
sudo ufw status
sudo ufw allow 53/tcp
sudo ufw allow 53/udp
```

### Issue 4: Root Hints File Missing

**Download root hints:**

```bash
sudo wget https://www.internic.net/domain/named.root -O /usr/share/dns/root.hints
```

**Verify file:**

```bash
ls -l /usr/share/dns/root.hints
```

### Issue 5: Permission Denied Errors

**Fix ownership:**

```bash
sudo chown -R bind:bind /var/cache/bind
sudo chmod 755 /var/cache/bind
```

**Fix AppArmor:**

```bash
sudo apparmor_parser -r /etc/apparmor.d/usr.sbin.named
```

### Issue 6: DNSSEC Validation Failures

**Disable DNSSEC temporarily for testing:**

```bash
sudo nano /etc/bind/named.conf.options
```

**Change:**

```bash
dnssec-validation no;
```

**Restart:**

```bash
sudo systemctl restart bind9
```

### Issue 7: High Memory Usage

**Limit cache size:**

```bash
sudo nano /etc/bind/named.conf.options
```

**Add:**

```bash
max-cache-size 128M;
```

### Issue 8: Client Not Using DNS Server

**Check resolv.conf:**

```bash
cat /etc/resolv.conf
```

**Should point to systemd-resolved stub:**

```
nameserver 127.0.0.53
```

**Check systemd-resolved configuration:**

```bash
resolvectl status
```

**Reset DNS settings:**

```bash
sudo resolvectl revert ens3
sudo resolvectl dns ens3 192.168.10.148
sudo systemctl restart systemd-resolved
```

---
# DNS, Web, and Mail Server Infrastructure Project in Open-Stack (PICO PUBLIC CLOUD)


## IMPORTANT NOTICE - TESTING ENVIRONMENT ONLY

**This documentation describes a test environment setup and is NOT suitable for production use.**

This infrastructure was built purely for **testing purposes** in a controlled lab environment.
All test results are located in the [test_result](test_result-screenshots/)

### For Production Deployment

If anyone plan to use this setup in a production environment, **MUST** refer to the comprehensive security hardening guide:

[production-security-hardening-guide.md](production-security-hardening-guide.md)


## Table of Contents

1. [Project Overview](#project-overview)
2. [Infrastructure Details](#infrastructure-details)
3. [DNS Server Configuration](#dns-server-configuration)
4. [Web Server Configuration](#web-server-configuration)
5. [Mail Server Configuration](#mail-server-configuration)
6. [Testing Results](#testing-results)
7. [Troubleshooting Guide](#troubleshooting-guide)
8. [Appendix: Configuration Files](#appendix-configuration-files)
9. [Quick Reference Commands](#quick-reference-commands)

---

## Project Overview

### Summary

Complete implementation of integrated DNS, web, and mail server infrastructure on an OpenStack-Based Local Cloud (Pico Public Cloud) for the **gelani.com** domain (gelani.com is a fictitious domain used for illustrative purposes). The project involves deploying two Ubuntu Server 22.04 VMs in a 192.168.20.0/24 subnet with full service integration and comprehensive testing.

### Domain Information

- **Domain Name:** gelani.com (fictitious domain for demonstration)
- **Subdomains:** 
  - ns1.gelani.com (DNS server)
  - www.gelani.com (web server)
  - mail.gelani.com (mail server)

### User Accounts Created

- nahid-101
- fuad-101
- ashfaq-101
- ubuntu (system administrator)

---

## Infrastructure Details

### Cloud Platform

**Provider:** Pico Public Cloud

### Network Configuration

- **Subnet:** 192.168.20.0/24
- **Gateway:** 192.168.20.1
- **DNS Server IP:** 192.168.20.20
- **Web/Mail Server IP:** 192.168.20.15

### Virtual Machines

#### VM 1: dns-lab (DNS Server)
**Terminal Log:** [cli-dns-lab.md](cli-dns-lab.md)

- **CPU:** 2 Cores
- **RAM:** 4 GB
- **Storage:** 40 GB NVMe
- **IP Address:** 192.168.20.20
- **OS:** Ubuntu Server 22.04 LTS
- **Services:** BIND9 DNS Server

#### VM 2: web-mail (Web & Mail Server)
**Terminal Log:** [cli-web-mail.md](cli-web-mail.md)

- **CPU:** 4 Cores
- **RAM:** 8 GB
- **Storage:** 80 GB NVMe
- **IP Address:** 192.168.20.15
- **OS:** Ubuntu Server 22.04 LTS
- **Services:** 
  - Nginx (Web Server)
    - Virtual Host 1: gelani.com, www.gelani.com (Main website)
    - Virtual Host 2: mail.gelani.com (Roundcube webmail)
  - Postfix (SMTP)
  - Dovecot (IMAP/POP3)
  - Roundcube (Webmail)
  - MariaDB (Database)
  - PHP 8.1-FPM

#### Testing Environment

- One Windows 10 Pro VM for client testing
- IP Address: 192.168.20.13

### Network Topology

```
Internet
    ↓
Gateway (192.168.20.1)
    ↓
    ├─→ DNS Server (192.168.20.20)
    │   └─ BIND9: ns1.gelani.com
    │
    ├─→ Web/Mail Server (192.168.20.15)
    │   ├─ Nginx Virtual Hosts:
    │   │   ├─ gelani.com, www.gelani.com
    │   │   └─ mail.gelani.com (Roundcube)
    │   ├─ Postfix: SMTP Server
    │   ├─ Dovecot: IMAP/POP3 Server
    │   ├─ Roundcube: Webmail Interface
    │   └─ MariaDB: Database Backend
    │
    └─→ Testing & Verification
        └─ PC-1: 192.168.20.13 (Windows 10 Pro)
```

---

## DNS Server Configuration

### System Preparation

#### 1. System Updates

```bash
sudo apt update
sudo apt upgrade -y
```

**Result:** Updated 72 packages, installed kernel 5.15.0-163, applied security patches.

#### 2. Network Configuration - Static IP Setup

**Challenge:** Cloud-init was overwriting manual network configurations.

**Solution:** Disable cloud-init network management and use netplan.

##### Step 2.1: Disable Cloud-Init Network Config

Create file: `/etc/cloud/cloud.cfg.d/99-disable-network-config.cfg`

```yaml
network: {config: disabled}
```

##### Step 2.2: Configure Static IP with Netplan

Create file: `/etc/netplan/01-netcfg.yaml`

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      addresses: [192.168.20.20/24]
      routes:
        - to: default
          via: 192.168.20.1
      nameservers:
        addresses: [127.0.0.1, 8.8.8.8]
      match:
        macaddress: fa:16:3e:01:4b:10
      mtu: 8942
```

##### Step 2.3: Secure Netplan Configuration

```bash
sudo chmod 600 /etc/netplan/01-netcfg.yaml
sudo rm /etc/netplan/50-cloud-init.yaml
sudo systemctl disable systemd-networkd-wait-online
sudo netplan apply
```

##### Step 2.4: Verify Network Connectivity

```bash
ping -c 3 192.168.20.1  # Gateway test
ping -c 3 8.8.8.8       # Internet test
```

**Expected Results:**
- Gateway: ~2.43ms, 0% packet loss
- Internet: ~33.3ms, 0% packet loss

### BIND9 Installation and Configuration

#### 3. Install BIND9 Packages

```bash
sudo apt install -y bind9 bind9utils bind9-doc dnsutils dns-root-data
```

#### 4. Main BIND9 Configuration

Edit file: `/etc/bind/named.conf.options`

```bind
options {
    directory "/var/cache/bind";
    
    // Allow recursion for local network
    recursion yes;
    allow-recursion { 192.168.20.0/24; localhost; };
    
    // Forwarders for external queries
    forwarders {
        8.8.8.8;
        8.8.4.4;
    };
    
    // Listen on all interfaces
    listen-on { any; };
    listen-on-v6 { any; };
    
    // DNSSEC validation
    dnssec-validation auto;
    
    // Query restrictions
    allow-query { 192.168.20.0/24; localhost; };
    
    auth-nxdomain no;
};
```

#### 5. Zone Configuration

Edit file: `/etc/bind/named.conf.local`

```bind
// Forward zone for gelani.com
zone "gelani.com" {
    type master;
    file "/etc/bind/zones/db.gelani.com";
};

// Reverse zone for 192.168.20.0/24
zone "20.168.192.in-addr.arpa" {
    type master;
    file "/etc/bind/zones/db.192.168.20";
};
```

#### 6. Create Zone Files Directory

```bash
sudo mkdir -p /etc/bind/zones
```

#### 7. Forward Zone File

Create file: `/etc/bind/zones/db.gelani.com`

```bind
;
; BIND data file for gelani.com
;
$TTL    604800
@       IN      SOA     ns1.gelani.com. admin.gelani.com. (
                        2024120401      ; Serial (YYYYMMDDNN format)
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
; Name servers
@       IN      NS      ns1.gelani.com.

; A records
ns1.gelani.com.         IN      A       192.168.20.20
gelani.com.             IN      A       192.168.20.15
mail.gelani.com.        IN      A       192.168.20.15

; CNAME records
www                     IN      CNAME   gelani.com.

; MX records
@                       IN      MX      10 mail.gelani.com.

; TXT/SPF records
@                       IN      TXT     "v=spf1 ip4:192.168.20.15 -all"
```

**Zone File Breakdown:**
- **SOA Record:** Defines the start of authority for the domain
- **NS Record:** Specifies the authoritative name server (ns1.gelani.com)
- **A Records:** Map hostnames to IP addresses
- **CNAME Record:** Creates alias (www → gelani.com)
- **MX Record:** Defines mail server with priority 10
- **TXT/SPF Record:** Sender Policy Framework for email authentication

#### 8. Reverse Zone File

Create file: `/etc/bind/zones/db.192.168.20`

```bind
;
; BIND reverse data file for 192.168.20.0/24
;
$TTL    604800
@       IN      SOA     ns1.gelani.com. admin.gelani.com. (
                        2024120401      ; Serial
                        604800          ; Refresh
                        86400           ; Retry
                        2419200         ; Expire
                        604800 )        ; Negative Cache TTL
;
; Name servers
@       IN      NS      ns1.gelani.com.

; PTR records
20      IN      PTR     ns1.gelani.com.
15      IN      PTR     gelani.com.
15      IN      PTR     mail.gelani.com.
```

#### 9. Set Proper Permissions

```bash
sudo chown root:bind /etc/bind/zones/db.gelani.com
sudo chown root:bind /etc/bind/zones/db.192.168.20
sudo chmod 644 /etc/bind/zones/db.gelani.com
sudo chmod 644 /etc/bind/zones/db.192.168.20
```

#### 10. Validate Configuration

```bash
# Check main configuration
sudo named-checkconf

# Check forward zone
sudo named-checkzone gelani.com /etc/bind/zones/db.gelani.com

# Check reverse zone
sudo named-checkzone 20.168.192.in-addr.arpa /etc/bind/zones/db.192.168.20
```

**Expected Output:** 
- `OK` for all checks
- Zone files should load without errors

#### 11. Restart and Enable BIND9

```bash
sudo systemctl restart bind9
sudo systemctl enable bind9
sudo systemctl status bind9
```

#### 12. DNS Server Testing (from DNS server itself)

```bash
# Test A records
dig @localhost gelani.com
dig @localhost www.gelani.com
dig @localhost mail.gelani.com
dig @localhost ns1.gelani.com

# Test reverse DNS
dig @localhost -x 192.168.20.15
dig @localhost -x 192.168.20.20

# Test MX record
dig @localhost gelani.com MX

# Test TXT/SPF record
dig @localhost gelani.com TXT
```

**Expected Results:**
- gelani.com → 192.168.20.15
- www.gelani.com → CNAME → 192.168.20.15
- mail.gelani.com → 192.168.20.15
- ns1.gelani.com → 192.168.20.20
- Query time: ~0ms (localhost)
- All queries should return NOERROR status

---

## Web Server Configuration

### System Preparation (web-mail VM)

#### 1. System Updates

```bash
sudo apt update
sudo apt upgrade -y
```

#### 2. Network Configuration - Static IP

**Challenge:** systemd-resolved was conflicting with custom DNS settings.

**Solution:** Disable systemd-resolved and create static /etc/resolv.conf.

##### Step 2.1: Disable Cloud-Init

Create file: `/etc/cloud/cloud.cfg.d/99-disable-network-config.cfg`

```yaml
network: {config: disabled}
```

##### Step 2.2: Configure Static IP

Create file: `/etc/netplan/01-netcfg.yaml`

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      addresses: [192.168.20.15/24]
      routes:
        - to: default
          via: 192.168.20.1
      nameservers:
        addresses: [192.168.20.20, 8.8.8.8]
      match:
        macaddress: fa:16:3e:28:2d:4e
      mtu: 8942
```

##### Step 2.3: Apply Configuration

```bash
sudo chmod 600 /etc/netplan/01-netcfg.yaml
sudo rm /etc/netplan/50-cloud-init.yaml
sudo netplan apply
```

##### Step 2.4: Disable systemd-resolved

```bash
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
```

##### Step 2.5: Create Static DNS Configuration

```bash
sudo rm /etc/resolv.conf
sudo nano /etc/resolv.conf
```

Add content:

```
nameserver 192.168.20.20
nameserver 8.8.8.8
```

##### Step 2.6: Protect resolv.conf from Changes

```bash
sudo chattr +i /etc/resolv.conf
```

To remove protection later (if needed):

```bash
sudo chattr -i /etc/resolv.conf
```

##### Step 2.7: Verify DNS Resolution

```bash
dig gelani.com
nslookup gelani.com
ping -c 3 gelani.com
```

**Expected Results:**
- dig shows 192.168.20.20 as DNS server
- Query time: ~8ms
- gelani.com resolves to 192.168.20.15
- 0% packet loss

### Nginx Web Server Installation

#### 3. Install Nginx

```bash
sudo apt install -y nginx
```

#### 4. Create Website Directory Structure

```bash
sudo mkdir -p /var/www/gelani.com/html
sudo chown -R $USER:$USER /var/www/gelani.com/html
sudo chmod -R 755 /var/www/gelani.com
```

#### 5. Create Website Content

Create file: `/var/www/gelani.com/html/index.html`

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Gelani.com</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f0f0f0;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            border-bottom: 3px solid #4CAF50;
            padding-bottom: 10px;
        }
        .info {
            background-color: #e7f3fe;
            padding: 15px;
            margin: 20px 0;
            border-left: 4px solid #2196F3;
        }
        .success {
            color: #4CAF50;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Gelani.com</h1>
        <p class="success">✓ Web Server is running successfully!</p>
        
        <div class="info">
            <h3>Server Information</h3>
            <ul>
                <li><strong>Domain:</strong> gelani.com</li>
                <li><strong>Web Server:</strong> Nginx</li>
                <li><strong>DNS Server:</strong> ns1.gelani.com (192.168.20.20)</li>
                <li><strong>Mail Server:</strong> mail.gelani.com (192.168.20.15)</li>
            </ul>
        </div>
        
        <h3>Available Services</h3>
        <ul>
            <li><a href="http://gelani.com">Main Website</a></li>
            <li><a href="http://www.gelani.com">WWW Subdomain</a></li>
            <li><a href="http://mail.gelani.com">Webmail (Roundcube)</a></li>
        </ul>
        
        <p><em>This server is part of a complete DNS, Web, and Mail infrastructure project.</em></p>
    </div>
</body>
</html>
```

#### 6. Configure Nginx Virtual Host

Create file: `/etc/nginx/sites-available/gelani.com`

```nginx
server {
    listen 80;
    listen [::]:80;
    
    server_name gelani.com www.gelani.com;
    
    root /var/www/gelani.com/html;
    index index.html index.htm;
    
    access_log /var/log/nginx/gelani.com.access.log;
    error_log /var/log/nginx/gelani.com.error.log;
    
    location / {
        try_files $uri $uri/ =404;
    }
}
```

#### 7. Enable Virtual Host

```bash
sudo ln -s /etc/nginx/sites-available/gelani.com /etc/nginx/sites-enabled/
sudo rm /etc/nginx/sites-enabled/default  # Remove default site
```

#### 8. Test and Restart Nginx

```bash
# Test configuration
sudo nginx -t

# Restart Nginx
sudo systemctl restart nginx
sudo systemctl enable nginx
sudo systemctl status nginx
```

#### 9. Web Server Testing

```bash
# Test from command line
curl http://gelani.com
curl http://www.gelani.com
curl -I http://gelani.com  # Check headers

# Expected output
# HTTP/1.1 200 OK
# Server: nginx/1.18.0
# Content-Type: text/html
```

### Windows Client Configuration

To enable proper DNS resolution and network connectivity for testing, the Windows 10 Pro client was configured with static IP address and custom DNS settings:

**Configuration Steps:**

1. Open **Control Panel** → **Network and Sharing Center** → **Change adapter settings**
2. Right-click on the active network adapter and select **Properties**
3. Select **Internet Protocol Version 4 (TCP/IPv4)** and click **Properties**
4. Configure the following settings:
   - **PC-1 (192.168.20.13):**
     - IP Address: `192.168.20.13`
     - Subnet Mask: `255.255.255.0`
     - Default Gateway: `192.168.20.1`
     - Preferred DNS Server: `192.168.20.20` (dns-lab server)
     - Alternate DNS Server: `8.8.8.8` (Google DNS as fallback)

5. Click **OK** to apply the settings
6. Open **Command Prompt** and verify configuration:

```cmd
ipconfig /all
nslookup gelani.com
ping gelani.com
```

This configuration ensured that Windows client could properly resolve domain names using the custom BIND9 DNS server and access web and mail services within the test environment.

**Testing from Windows Client:**

1. Configure DNS to use 192.168.20.20
2. Open browser and navigate to:
   - http://gelani.com
   - http://www.gelani.com
3. Both should display the welcome page

---

## Mail Server Configuration

### Postfix Installation (SMTP Server)

#### 1. Install Postfix

```bash
sudo apt install -y postfix
```

**Installation Prompts:**
- Configuration type: **Internet Site**
- System mail name: **gelani.com**

#### 2. Configure Postfix

Edit file: `/etc/postfix/main.cf`

Key configuration settings:

```
# Basic settings
myhostname = mail.gelani.com
mydomain = gelani.com
myorigin = $mydomain

# Network settings
inet_interfaces = all
inet_protocols = all

# Destination settings
mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain

# Network access
mynetworks = 127.0.0.0/8, 192.168.20.0/24

# Mailbox settings
home_mailbox = Maildir/

# Disable relay
relayhost =
```

#### 3. Restart and Enable Postfix

```bash
sudo systemctl restart postfix
sudo systemctl enable postfix
sudo systemctl status postfix
```

### Dovecot Installation (IMAP/POP3 Server)

#### 4. Install Dovecot Packages

**Challenge:** Initial installation missing LMTP module, causing service failure.

**Solution:** Install all necessary Dovecot packages including LMTP.

```bash
sudo apt install -y dovecot-core dovecot-imapd dovecot-pop3d dovecot-lmtpd
```

#### 5. Configure Dovecot

##### Step 5.1: Main Configuration

Edit file: `/etc/dovecot/dovecot.conf`

```
# Protocols
protocols = imap pop3 lmtp

# Listen on all interfaces
listen = *, ::
```

##### Step 5.2: Mail Location

Edit file: `/etc/dovecot/conf.d/10-mail.conf`

```
# Mail location
mail_location = maildir:~/Maildir

# Namespace configuration
namespace inbox {
  inbox = yes
}
```

##### Step 5.3: Authentication

Edit file: `/etc/dovecot/conf.d/10-auth.conf`

```
# Disable plaintext auth (set to 'no' for testing only)
disable_plaintext_auth = no

# Authentication mechanisms
auth_mechanisms = plain login

# Include auth-system.conf
!include auth-system.conf.ext
```

**Security Note:** `disable_plaintext_auth = no` is for testing only. In production, use TLS/SSL encryption.

##### Step 5.4: Master Configuration (Postfix Integration)

Edit file: `/etc/dovecot/conf.d/10-master.conf`

Find the `service auth` section and add:

```
service auth {
  unix_listener /var/spool/postfix/private/auth {
    mode = 0660
    user = postfix
    group = postfix
  }
}
```

**Common Error:** Extra closing brace `}` can cause syntax errors. Ensure proper bracket matching.

#### 6. Restart and Enable Dovecot

```bash
sudo systemctl restart dovecot
sudo systemctl enable dovecot
sudo systemctl status dovecot
```

**Expected Status:** 
- Active (running)
- Dovecot v2.3.16

### PHP Installation (for Roundcube)

#### 7. Install PHP and Required Extensions

**Challenge:** Apache2 was auto-installed with PHP, causing port 80 conflict with Nginx.

**Solution:** Purge Apache2 and install PHP-FPM for Nginx.

##### Step 7.1: Remove Apache2 (if installed)

```bash
sudo systemctl stop apache2
sudo apt purge -y apache2 apache2-*
sudo apt autoremove -y
```

##### Step 7.2: Install PHP-FPM and Extensions

```bash
sudo apt install -y php8.1-fpm php8.1-cli php8.1-mysql php8.1-xml \
  php8.1-mbstring php8.1-curl php8.1-gd php8.1-intl php8.1-ldap \
  php8.1-zip php8.1-imagick
```

##### Step 7.3: Start and Enable PHP-FPM

```bash
sudo systemctl start php8.1-fpm
sudo systemctl enable php8.1-fpm
sudo systemctl status php8.1-fpm
```

### MariaDB Installation

#### 8. Install MariaDB

```bash
sudo apt install -y mariadb-server mariadb-client
```

#### 9. Secure MariaDB Installation

```bash
sudo mysql_secure_installation
```

**Configuration Choices:**
- Switch to unix_socket authentication: **Yes**
- Change root password: **No** (unix_socket already secure)
- Remove anonymous users: **Yes**
- Disallow root login remotely: **Yes**
- Remove test database: **No** (keep for testing)
- Reload privilege tables: **Yes**

#### 10. Verify MariaDB

```bash
sudo systemctl status mariadb
sudo mysql -u root
```

From MySQL prompt:

```sql
SHOW DATABASES;
EXIT;
```

### Roundcube Webmail Installation

#### 11. Install Roundcube

**Challenge:** Initial installation failed because MariaDB wasn't running.

**Solution:** Ensure MariaDB is active, then reconfigure Roundcube.

```bash
# Verify MariaDB is running
sudo systemctl status mariadb

# Install Roundcube
sudo apt install -y roundcube roundcube-core roundcube-mysql
```

**Installation Prompts:**
- Configure database with dbconfig-common: **Yes**
- MySQL application password: Leave empty for auto-generation
- Password confirmation: Leave empty

#### 12. Configure Roundcube

Edit file: `/etc/roundcube/config.inc.php`

Add/modify these settings:

```php
<?php

// Database configuration (auto-generated)
$config['db_dsnw'] = 'mysql://roundcube:PASSWORD@localhost/roundcube';

// IMAP Configuration
$config['default_host'] = 'mail.gelani.com';
$config['default_port'] = 143;
$config['imap_auth_type'] = null;

// SMTP Configuration
$config['smtp_server'] = 'mail.gelani.com';
$config['smtp_port'] = 25;
$config['smtp_user'] = '%u';
$config['smtp_pass'] = '%p';
$config['smtp_auth_type'] = null;

// Display settings
$config['product_name'] = 'Gelani Webmail';
$config['support_url'] = '';

// User interface
$config['language'] = 'en_US';
$config['skin'] = 'elastic';

// Security
$config['des_key'] = 'AUTO_GENERATED_KEY_HERE';
```

#### 13. Configure Nginx for Roundcube

Create file: `/etc/nginx/sites-available/mail.gelani.com`

```nginx
server {
    listen 80;
    listen [::]:80;
    
    server_name mail.gelani.com;
    
    root /usr/share/roundcube;
    index index.php index.html;
    
    access_log /var/log/nginx/mail.gelani.com.access.log;
    error_log /var/log/nginx/mail.gelani.com.error.log;
    
    location / {
        try_files $uri $uri/ /index.php?$args;
    }
    
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
    
    # Deny access to sensitive directories
    location ~* ^/(bin|SQL|config|temp|logs)/ {
        deny all;
    }
    
    # Deny access to hidden files
    location ~ /\. {
        deny all;
    }
}
```

#### 14. Enable Roundcube Virtual Host

```bash
sudo ln -s /etc/nginx/sites-available/mail.gelani.com /etc/nginx/sites-enabled/
```

#### 15. Set Proper Permissions

```bash
sudo chown -R www-data:www-data /var/lib/roundcube
sudo chmod -R 755 /var/lib/roundcube
```

#### 16. Restart All Services

```bash
sudo systemctl restart php8.1-fpm
sudo systemctl restart nginx
sudo systemctl restart mariadb
sudo systemctl restart postfix
sudo systemctl restart dovecot
```

#### 17. Verify All Services

```bash
sudo systemctl status php8.1-fpm
sudo systemctl status nginx
sudo systemctl status mariadb
sudo systemctl status postfix
sudo systemctl status dovecot
```

**Expected Status:** All services should show `active (running)`

### User Account Creation

#### 18. Create Test Users

**Challenge:** Inconsistent naming convention needed standardization.

**Solution:** Created users with consistent xxx-101 format.

##### Create Users

```bash
# Create users with home directories
sudo useradd -m -s /bin/bash nahid-101
sudo useradd -m -s /bin/bash fuad-101
sudo useradd -m -s /bin/bash ashfaq-101

# Set passwords
sudo passwd nahid-101
sudo passwd fuad-101
sudo passwd ashfaq-101
```

**Note:** After creating users, you can either:
1. Log in as each user and let the system automatically create necessary directories (must use `adduser` command, not `useradd`)
2. Wait for Roundcube/Dovecot to automatically create the Maildir structure when the user first sends or receives email
3. Manually create the Maildir structure (optional, shown below)

##### Rename Existing Users (if needed)

Create bash script for renaming: `/home/ubuntu/rename_user.sh`

```bash
#!/bin/bash

# User renaming script
OLD_USER="$1"
NEW_USER="$2"

# Rename user
sudo usermod -l "$NEW_USER" "$OLD_USER"

# Rename group
sudo groupmod -n "$NEW_USER" "$OLD_USER"

# Rename home directory
sudo mv "/home/$OLD_USER" "/home/$NEW_USER"

# Update home directory path
sudo usermod -d "/home/$NEW_USER" -m "$NEW_USER"

echo "User $OLD_USER renamed to $NEW_USER successfully"
```

Usage:

```bash
chmod +x rename_user.sh
./rename_user.sh fuad-102 fuad-101
./rename_user.sh ashfaq-103 ashfaq-101
```

#### 19. Maildir Structure Creation

**Important:** The Maildir structure is **automatically created** by Dovecot when a user first receives or sends an email through Roundcube or any IMAP/POP3 client. Manual creation is **optional** and only needed if you want to pre-configure the mail directories.

##### Automatic Creation (Recommended)

Simply have each user:
1. Log into Roundcube webmail (http://mail.gelani.com)
2. Send or receive their first email
3. Dovecot will automatically create the Maildir structure with proper permissions

##### Manual Creation (Optional)

If you prefer to create the Maildir structure manually before the first email:

```bash
# Create Maildir for each user (optional)
sudo -u nahid-101 mkdir -p /home/nahid-101/Maildir/{cur,new,tmp}
sudo -u fuad-101 mkdir -p /home/fuad-101/Maildir/{cur,new,tmp}
sudo -u ashfaq-101 mkdir -p /home/ashfaq-101/Maildir/{cur,new,tmp}
sudo -u ubuntu mkdir -p /home/ubuntu/Maildir/{cur,new,tmp}
```

**Maildir Structure Explanation:**
- `cur/` - Contains read/processed messages
- `new/` - Contains new, unread messages
- `tmp/` - Temporary storage during message delivery

**Verification:**

```bash
# Check if Maildir exists for a user
ls -la /home/nahid-101/Maildir/

# After first email, you should see the structure automatically created
```

---

## Testing Results

### DNS Resolution Testing

#### From DNS Server (192.168.20.20)

```bash
# Test A records
dig @localhost gelani.com
dig @localhost www.gelani.com
dig @localhost mail.gelani.com
dig @localhost ns1.gelani.com

# Test reverse DNS
dig @localhost -x 192.168.20.15
dig @localhost -x 192.168.20.20

# Test MX record
dig @localhost gelani.com MX

# Test TXT record
dig @localhost gelani.com TXT
```

**Results:**
- gelani.com → 192.168.20.15 ✓
- www.gelani.com → CNAME → 192.168.20.15 ✓
- mail.gelani.com → 192.168.20.15 ✓
- ns1.gelani.com → 192.168.20.20 ✓
- Reverse DNS working ✓
- MX record: mail.gelani.com (priority 10) ✓
- SPF record present ✓
- Query time: 0ms (localhost)

#### From Web/Mail Server (192.168.20.15)

```bash
dig gelani.com
nslookup gelani.com
ping -c 3 gelani.com
```

**Results:**
- DNS server: 192.168.20.20 ✓
- Query time: ~8ms ✓
- gelani.com → 192.168.20.15 ✓
- 0% packet loss ✓

#### From Windows Clients

**DNS Configuration:**
- Primary DNS: 192.168.20.20
- Secondary DNS: 8.8.8.8

**Commands:**

```cmd
nslookup gelani.com
nslookup www.gelani.com
nslookup mail.gelani.com
nslookup ns1.gelani.com
ping gelani.com
```

**Results:** All DNS queries successful from Windows clients ✓

### Web Server Testing

#### Command Line Testing (from web-mail server)

```bash
# Test main domain
curl http://gelani.com

# Test www subdomain
curl http://www.gelani.com

# Check HTTP headers
curl -I http://gelani.com

# Expected output:
# HTTP/1.1 200 OK
# Server: nginx/1.18.0
# Content-Type: text/html
# Content-Length: 956
```

**Results:**
- HTTP 200 OK ✓
- Content served correctly ✓
- CNAME working (www → gelani.com) ✓
- Nginx version: 1.18.0 ✓

#### Browser Testing (from Windows client)

**URLs Tested:**
1. http://gelani.com
2. http://www.gelani.com
3. http://192.168.20.15 (direct IP)

**Results:** All URLs display welcome page correctly ✓

### Mail Server Testing

#### Service Status Verification

```bash
sudo systemctl status postfix
sudo systemctl status dovecot
sudo systemctl status mariadb
sudo systemctl status php8.1-fpm
```

**Results:**
- Postfix: active (exited) - SMTP ready ✓
- Dovecot: active (running) - v2.3.16 ✓
- MariaDB: active (running) - v10.6.22 ✓
- PHP-FPM: active (running) ✓

#### Roundcube Webmail Access

**URL:** http://mail.gelani.com

**Results:** All users can access webmail ✓

**Important Note - Email Address Compatibility:**

Email addresses work with **both domain formats** due to the Postfix `mydestination` configuration in `/etc/postfix/main.cf`:
```bash
mydomain = gelani.com
mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain
# This expands to: mail.gelani.com, localhost.gelani.com, localhost, gelani.com
```

This means both address formats are valid and deliver to the same mailbox:
- `nahid-101@gelani.com` ✓
- `nahid-101@mail.gelani.com` ✓

**Tested Email Address Formats:**

| Format | Example | Status |
|--------|---------|--------|
| Primary Domain | nahid-101@gelani.com | ✓ Works |
| Mail Hostname | nahid-101@mail.gelani.com | ✓ Works |

Both formats deliver to the same user mailbox. For all tests below, either format can be used interchangeably.

#### Email Testing Matrix

##### Test 1: Internal Email (nahid-101 → fuad-101)

**From:** Roundcube web interface  
**Sender:** nahid-101@gelani.com  
**Recipient:** fuad-101@gelani.com  
**Subject:** Test Email 1  
**Result:** Delivered successfully ✓

##### Test 2: Internal Email (fuad-101 → ashfaq-101)

**From:** Roundcube web interface  
**Sender:** fuad-101@gelani.com  
**Recipient:** ashfaq-101@gelani.com  
**Subject:** Test Email 2  
**Result:** Delivered successfully ✓

##### Test 3: Email from Windows Client (ashfaq-101 → nahid-101)

**From:** Windows email client (configured with IMAP/SMTP)  
**Sender:** ashfaq-101@gelani.com  
**Recipient:** nahid-101@gelani.com  
**Subject:** Test from Windows  
**Result:** Delivered successfully ✓

##### Test 4: System User Email (ubuntu → nahid-101)

**From:** Command line (mail command or Roundcube)  
**Sender:** ubuntu@gelani.com  
**Recipient:** nahid-101@gelani.com  
**Subject:** System Test  
**Result:** Delivered successfully ✓

---

### Best Practice Recommendation for Production

For production deployments, consider standardizing on **one** domain format for email addresses:

#### Option 1: Keep Both Domains (Current Setup)

**Advantages:**
- ✓ More flexible - users can use either format
- ✓ Both `@gelani.com` and `@mail.gelani.com` work

**Disadvantages:**
- Can be confusing for users
- Harder to communicate the "official" email address
- Inconsistent business card/signature formats

**Configuration:** No changes needed (current setup)

#### Option 2: Restrict to Primary Domain Only (Recommended)

**Use:** `nahid-101@gelani.com` format only

Edit `/etc/postfix/main.cf`:
```bash
# Remove $myhostname to disable mail.gelani.com addresses
mydestination = localhost.$mydomain, localhost, $mydomain
```

**Advantages:**
- ✓ Cleaner: `user@company.com` not `user@mail.company.com`
- ✓ More professional appearance
- ✓ Easier to communicate to users and clients
- ✓ Standard business practice

**This is the most common choice for production environments.**

#### Option 3: Restrict to Mail Hostname Only

**Use:** `nahid-101@mail.gelani.com` format only

Edit `/etc/postfix/main.cf`:
```bash
# Remove $mydomain to disable gelani.com addresses
mydestination = $myhostname, localhost.$mydomain, localhost
```

**Use Case:** Internal mail servers or when the primary domain is used elsewhere

**After making changes, restart Postfix:**
```bash
sudo postfix check
sudo systemctl restart postfix
```

**Recommendation:** Most organizations choose **Option 2** for clarity and professionalism. Test thoroughly after any `mydestination` changes to ensure mail delivery continues to work correctly.

#### Log Verification

```bash
# Check mail logs
sudo tail -f /var/log/mail.log

# Check Postfix queue
sudo postqueue -p

# Check Dovecot logs
sudo tail -f /var/log/dovecot.log
```

**Results:**
- ✓ No errors in logs 
- ✓ Mail queue empty (all delivered)
- ✓ IMAP connections successful

## Troubleshooting Guide

### Common Issues and Solutions

#### Issue 1: Cloud-Init Overwriting Network Configuration

**Problem:** After reboot, static IP configuration is lost.

**Symptoms:**
- IP address changes back to DHCP
- Network settings revert to cloud-init defaults

**Solution:**

```bash
# Disable cloud-init network management
sudo nano /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
# Add: network: {config: disabled}

# Remove cloud-init netplan
sudo rm /etc/netplan/50-cloud-init.yaml

# Secure custom netplan file
sudo chmod 600 /etc/netplan/01-netcfg.yaml
```

#### Issue 2: DNS Resolution Not Working

**Problem:** Cannot resolve domain names.

**Symptoms:**

```
; <<>> DiG 9.18.28-1~deb12u2-Debian <<>> gelani.com
;; connection timed out; no servers could be reached
```

**Solution:**

```bash
# Check if systemd-resolved is interfering
sudo systemctl status systemd-resolved

# If running, stop and disable it
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved

# Create static resolv.conf
sudo rm /etc/resolv.conf
sudo nano /etc/resolv.conf
# Add:
# nameserver 192.168.20.20
# nameserver 8.8.8.8

# Protect from changes
sudo chattr +i /etc/resolv.conf
```

#### Issue 3: Dovecot Service Fails to Start

**Problem:** Dovecot won't start, showing LMTP error.

**Symptoms:**

```
Fatal: service(lmtp) access(/usr/lib/dovecot/lmtp) failed: No such file or directory
```

**Solution:**

```bash
# Install missing LMTP module
sudo apt install -y dovecot-lmtpd

# Restart Dovecot
sudo systemctl restart dovecot
```

#### Issue 4: Apache and Nginx Port Conflict

**Problem:** Nginx fails to start due to port 80 being in use.

**Symptoms:**

```
nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Address already in use)
```

**Solution:**

```bash
# Check what's using port 80
sudo lsof -i :80

# If Apache2 is running
sudo systemctl stop apache2
sudo apt purge -y apache2 apache2-*
sudo apt autoremove -y

# Restart Nginx
sudo systemctl restart nginx
```

#### Issue 5: Roundcube Database Connection Failed

**Problem:** Roundcube installation fails during database setup.

**Symptoms:**

```
ERROR 2002 (HY000): Can't connect to local server through socket '/run/mysqld/mysqld.sock'
```

**Solution:**

```bash
# Ensure MariaDB is running
sudo systemctl start mariadb
sudo systemctl status mariadb

# Reconfigure Roundcube
sudo dpkg-reconfigure roundcube-core
```

#### Issue 6: Configuration File Syntax Errors

**Problem:** Service fails to start due to syntax errors.

**Symptoms:**

```
dovecot: Fatal: Error in configuration file /etc/dovecot/conf.d/10-master.conf line 109: Unexpected '}'
```

**Solution:**

```bash
# Check configuration syntax
sudo doveconf -n  # For Dovecot
sudo named-checkconf  # For BIND9
sudo nginx -t  # For Nginx
sudo postfix check  # For Postfix

# Review the file carefully for:
# - Extra/missing brackets { }
# - Missing semicolons ;
# - Typos in directives
# - Incorrect indentation
```

#### Issue 7: Permissions Errors

**Problem:** Web server cannot read files or mail server cannot write.

**Symptoms:**
- 403 Forbidden errors
- Unable to save messages
- File permission denied

**Solution:**

```bash
# Fix web directory permissions
sudo chown -R www-data:www-data /var/www/gelani.com
sudo chmod -R 755 /var/www/gelani.com

# Fix Roundcube permissions
sudo chown -R www-data:www-data /var/lib/roundcube
sudo chmod -R 755 /var/lib/roundcube

# Fix mail directory permissions
sudo chmod 700 /home/*/Maildir
sudo chown -R [username]:[username] /home/[username]/Maildir
```

#### Issue 8: Netplan Warnings

**Problem:** Netplan shows permission warnings.

**Symptoms:**

```
** (generate:1234): WARNING **: Permissions for /etc/netplan/01-netcfg.yaml are too open. Netplan configuration should NOT be accessible by others.
```

**Solution:**

```bash
sudo chmod 600 /etc/netplan/01-netcfg.yaml
sudo netplan apply
```

#### Issue 9: Mail Not Being Delivered

**Problem:** Emails are not reaching recipients.

**Solution:**

```bash
# Check Postfix queue
sudo postqueue -p

# View mail logs
sudo tail -f /var/log/mail.log

# Test SMTP manually
telnet mail.gelani.com 25
# Then type:
# HELO gelani.com
# MAIL FROM:<test@gelani.com>
# RCPT TO:<user@gelani.com>
# DATA
# Test message
# .
# QUIT

# Check Dovecot IMAP
telnet mail.gelani.com 143
# Then type:
# a1 LOGIN username password
# a2 LIST "" "*"
# a3 LOGOUT
```

#### Issue 10: Firewall Blocking Connections

**Problem:** Cannot connect to services from remote machines.

**Solution:**

```bash
# Check if UFW is active
sudo ufw status

# If needed, allow ports (testing environment)
sudo ufw allow 53/tcp
sudo ufw allow 53/udp
sudo ufw allow 80/tcp
sudo ufw allow 25/tcp
sudo ufw allow 143/tcp
sudo ufw allow 110/tcp

# Or disable firewall for testing
sudo ufw disable
```

### Diagnostic Commands Reference

```bash
# Network diagnostics
ip addr show
ip route show
ping -c 3 [target]
traceroute [target]
netstat -tulpn
ss -tulpn

# DNS diagnostics
dig @[server] [domain]
nslookup [domain]
host [domain]
named-checkconf
named-checkzone [zone] [file]

# Web server diagnostics
curl -I [url]
wget -O- [url]
nginx -t
nginx -T  # Show full configuration

# Mail server diagnostics
postconf -n  # Postfix configuration
doveconf -n  # Dovecot configuration
postqueue -p  # Mail queue
mailq  # Alternative mail queue command

# Service management
systemctl status [service]
systemctl restart [service]
journalctl -u [service] -f  # Follow logs

# Log files
tail -f /var/log/syslog
tail -f /var/log/mail.log
tail -f /var/log/nginx/access.log
tail -f /var/log/nginx/error.log
```

---

## Appendix: Configuration Files

### Complete Configuration Files Reference

#### A. DNS Server Configuration Files

**File:** `/etc/cloud/cloud.cfg.d/99-disable-network-config.cfg`

```yaml
network: {config: disabled}
```

**File:** `/etc/netplan/01-netcfg.yaml` (DNS Server)

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      addresses: [192.168.20.20/24]
      routes:
        - to: default
          via: 192.168.20.1
      nameservers:
        addresses: [127.0.0.1, 8.8.8.8]
      match:
        macaddress: fa:16:3e:01:4b:10
      mtu: 8942
```

**File:** `/etc/bind/named.conf.options`

```bind
options {
    directory "/var/cache/bind";
    
    recursion yes;
    allow-recursion { 192.168.20.0/24; localhost; };
    
    forwarders {
        8.8.8.8;
        8.8.4.4;
    };
    
    listen-on { any; };
    listen-on-v6 { any; };
    
    dnssec-validation auto;
    
    allow-query { 192.168.20.0/24; localhost; };
    
    auth-nxdomain no;
};
```

**File:** `/etc/bind/named.conf.local`

```bind
zone "gelani.com" {
    type master;
    file "/etc/bind/zones/db.gelani.com";
};

zone "20.168.192.in-addr.arpa" {
    type master;
    file "/etc/bind/zones/db.192.168.20";
};
```

**File:** `/etc/bind/zones/db.gelani.com`

```bind
$TTL    604800
@       IN      SOA     ns1.gelani.com. admin.gelani.com. (
                        2024120401
                        604800
                        86400
                        2419200
                        604800 )
;
@       IN      NS      ns1.gelani.com.
ns1.gelani.com.         IN      A       192.168.20.20
gelani.com.             IN      A       192.168.20.15
mail.gelani.com.        IN      A       192.168.20.15
www                     IN      CNAME   gelani.com.
@                       IN      MX      10 mail.gelani.com.
@                       IN      TXT     "v=spf1 ip4:192.168.20.15 -all"
```

**File:** `/etc/bind/zones/db.192.168.20`

```bind
$TTL    604800
@       IN      SOA     ns1.gelani.com. admin.gelani.com. (
                        2024120401
                        604800
                        86400
                        2419200
                        604800 )
;
@       IN      NS      ns1.gelani.com.
20      IN      PTR     ns1.gelani.com.
15      IN      PTR     gelani.com.
15      IN      PTR     mail.gelani.com.
```

#### B. Web/Mail Server Configuration Files

**File:** `/etc/netplan/01-netcfg.yaml` (Web/Mail Server)

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      addresses: [192.168.20.15/24]
      routes:
        - to: default
          via: 192.168.20.1
      nameservers:
        addresses: [192.168.20.20, 8.8.8.8]
      match:
        macaddress: fa:16:3e:28:2d:4e
      mtu: 8942
```

**File:** `/etc/resolv.conf`

```
nameserver 192.168.20.20
nameserver 8.8.8.8
```

**File:** `/etc/nginx/sites-available/gelani.com`

```nginx
server {
    listen 80;
    listen [::]:80;
    
    server_name gelani.com www.gelani.com;
    
    root /var/www/gelani.com/html;
    index index.html index.htm;
    
    access_log /var/log/nginx/gelani.com.access.log;
    error_log /var/log/nginx/gelani.com.error.log;
    
    location / {
        try_files $uri $uri/ =404;
    }
}
```

**File:** `/etc/nginx/sites-available/mail.gelani.com`

```nginx
server {
    listen 80;
    listen [::]:80;
    
    server_name mail.gelani.com;
    
    root /usr/share/roundcube;
    index index.php index.html;
    
    access_log /var/log/nginx/mail.gelani.com.access.log;
    error_log /var/log/nginx/mail.gelani.com.error.log;
    
    location / {
        try_files $uri $uri/ /index.php?$args;
    }
    
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
    
    location ~* ^/(bin|SQL|config|temp|logs)/ {
        deny all;
    }
    
    location ~ /\. {
        deny all;
    }
}
```

**File:** `/etc/postfix/main.cf` (Key Settings)

```
myhostname = mail.gelani.com
mydomain = gelani.com
myorigin = $mydomain
inet_interfaces = all
inet_protocols = all
mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain
mynetworks = 127.0.0.0/8, 192.168.20.0/24
home_mailbox = Maildir/
relayhost =
```

**File:** `/etc/dovecot/dovecot.conf` (Key Settings)

```
protocols = imap pop3 lmtp
listen = *, ::
```

**File:** `/etc/dovecot/conf.d/10-mail.conf` (Key Settings)

```
mail_location = maildir:~/Maildir
namespace inbox {
  inbox = yes
}
```

**File:** `/etc/dovecot/conf.d/10-auth.conf` (Key Settings)

```
disable_plaintext_auth = no
auth_mechanisms = plain login
!include auth-system.conf.ext
```

**File:** `/etc/dovecot/conf.d/10-master.conf` (Postfix Auth Section)

```
service auth {
  unix_listener /var/spool/postfix/private/auth {
    mode = 0660
    user = postfix
    group = postfix
  }
}
```

**File:** `/etc/roundcube/config.inc.php` (Key Settings)

```php
<?php
$config['db_dsnw'] = 'mysql://roundcube:PASSWORD@localhost/roundcube';
$config['default_host'] = 'mail.gelani.com';
$config['default_port'] = 143;
$config['smtp_server'] = 'mail.gelani.com';
$config['smtp_port'] = 25;
$config['smtp_user'] = '%u';
$config['smtp_pass'] = '%p';
$config['product_name'] = 'Gelani Webmail';
$config['des_key'] = 'AUTO_GENERATED_KEY';
?>
```

---

## Quick Reference Commands

### Service Management

```bash
# Restart all services
sudo systemctl restart bind9 nginx postfix dovecot mariadb php8.1-fpm

# Check all services status
sudo systemctl status bind9 nginx postfix dovecot mariadb php8.1-fpm

# Enable services on boot
sudo systemctl enable bind9 nginx postfix dovecot mariadb php8.1-fpm
```

### DNS Testing

```bash
dig @192.168.20.20 gelani.com
nslookup gelani.com 192.168.20.20
host gelani.com 192.168.20.20
```

### Web Testing

```bash
curl http://gelani.com
curl http://www.gelani.com
curl http://mail.gelani.com
```

### Mail Testing

```bash
# Check mail queue
sudo postqueue -p

# Send test email (command line)
echo "Test message" | mail -s "Test" user@gelani.com

# Check user mailbox
sudo ls -la /home/username/Maildir/new/
```

### Log Monitoring

```bash
# Follow all mail logs
sudo tail -f /var/log/mail.log

# Follow nginx logs
sudo tail -f /var/log/nginx/access.log
sudo tail -f /var/log/nginx/error.log

# Follow system logs
sudo tail -f /var/log/syslog
```

---

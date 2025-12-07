# DNS, Web, and Mail Server Infrastructure Project

---

## Table of Contents
1. [Project Overview](#project-overview)
2. [Infrastructure Details](#infrastructure-details)
3. [DNS Server Configuration](#dns-server-configuration)
4. [Web Server Configuration](#web-server-configuration)
5. [Mail Server Configuration](#mail-server-configuration)
6. [Testing Results](#testing-results)
7. [Troubleshooting Guide](#troubleshooting-guide)
8. [Security Considerations](#security-considerations)
9. [Appendix: Configuration Files](#appendix-configuration-files)

---

## Project Overview

### Summary
Complete implementation of integrated DNS, web, and mail server infrastructure on Pico Public Cloud for the **gelani.com** domain (gelnai.com is a fictitious domain used for illustrative purposes.). The project involves deploying two Ubuntu Server 22.04 VMs in a 192.168.20.0/24 subnet with full service integration and comprehensive testing.

### Domain Information
- **Domain Name:** gelani.com (this is a fictitious domain used for illustrative purposes)
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
- **CPU:** 2 Cores
- **RAM:** 8 GB
- **Storage:** 80 GB NVMe
- **IP Address:** 192.168.20.20
- **OS:** Ubuntu Server 22.04 LTS
- **Services:** BIND9 DNS Server

#### VM 2: web-mail (Web & Mail Server)
- **CPU:** 4 Cores
- **RAM:** 8 GB
- **Storage:** 100 GB NVMe
- **IP Address:** 192.168.20.15
- **OS:** Ubuntu Server 22.04 LTS
- **Services:** 
  - Nginx (Web Server)
  - Postfix (SMTP)
  - Dovecot (IMAP/POP3)
  - Roundcube (Webmail)
  - MariaDB (Database)
  - PHP 8.1-FPM

#### Testing Environment
- Three Windows VMs for client testing
- IP Range: 192.168.20.x

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
    │   ├─ Nginx: gelani.com, www.gelani.com
    │   ├─ Postfix: SMTP Server
    │   ├─ Dovecot: IMAP/POP3 Server
    │   ├─ Roundcube: mail.gelani.com
    │   └─ MariaDB: Database Backend
    │
    └─→ Windows Clients (192.168.20.x)
        └─ Testing & Verification
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

#### 19. Create Maildir Structure for Users
```bash
# Create Maildir for each user
sudo -u nahid-101 mkdir -p /home/nahid-101/Maildir/{cur,new,tmp}
sudo -u fuad-101 mkdir -p /home/fuad-101/Maildir/{cur,new,tmp}
sudo -u ashfaq-101 mkdir -p /home/ashfaq-101/Maildir/{cur,new,tmp}
sudo -u ubuntu mkdir -p /home/ubuntu/Maildir/{cur,new,tmp}
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

#### Browser Testing (from Windows clients)

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

**Login Tests:**
1. nahid-101 / [password] → Success ✓
2. fuad-101 / [password] → Success ✓
3. ashfaq-101 / [password] → Success ✓
4. ubuntu / [password] → Success ✓

**Results:** All users can access webmail ✓

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

#### Email Client Configuration (Windows)

**IMAP Settings:**
- Server: mail.gelani.com
- Port: 143
- Security: None (testing only)
- Username: nahid-101
- Password: [user password]

**SMTP Settings:**
- Server: mail.gelani.com
- Port: 25
- Security: None (testing only)
- Username: nahid-101
- Password: [user password]

**Result:** Email client successfully sends and receives ✓

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
- No errors in logs ✓
- Mail queue empty (all delivered) ✓
- IMAP connections successful ✓

### Complete Testing Summary

| Component | Test | Result | Notes |
|-----------|------|--------|-------|
| DNS | Forward lookup | ✓ PASS | All domains resolve correctly |
| DNS | Reverse lookup | ✓ PASS | PTR records working |
| DNS | CNAME resolution | ✓ PASS | www → gelani.com |
| DNS | MX record | ✓ PASS | mail.gelani.com priority 10 |
| Web | HTTP access | ✓ PASS | 200 OK responses |
| Web | Virtual hosts | ✓ PASS | gelani.com and www work |
| Web | Browser access | ✓ PASS | From Windows clients |
| Mail | SMTP delivery | ✓ PASS | Local delivery working |
| Mail | IMAP access | ✓ PASS | All users can login |
| Mail | Roundcube | ✓ PASS | Web interface accessible |
| Mail | Cross-user email | ✓ PASS | All test emails delivered |
| Mail | Windows client | ✓ PASS | External client configured |

---

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

## Security Considerations

### Current Configuration (Testing Environment)

⚠️ **WARNING:** The current configuration is for **TESTING PURPOSES ONLY** and should NOT be used in production.

#### Security Weaknesses in Current Setup:

1. **No Encryption**
   - HTTP instead of HTTPS (port 80)
   - SMTP without TLS (port 25)
   - IMAP without encryption (port 143)
   - POP3 without encryption (port 110)

2. **Authentication Issues**
   - Plain text password authentication enabled
   - No certificate-based authentication
   - Weak password policy

3. **Firewall**
   - UFW disabled for testing
   - All ports exposed
   - No rate limiting

4. **Mail Security**
   - No SPF enforcement (record exists but not enforced)
   - No DKIM signatures
   - No DMARC policy
   - Open relay protection basic only

5. **Access Control**
   - Broad network access (entire 192.168.20.0/24)
   - No IP-based restrictions
   - No fail2ban for brute force protection

### Production Security Requirements

#### 1. SSL/TLS Certificates

**Obtain Certificates:**
```bash
# Using Let's Encrypt (for public domains)
sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx -d gelani.com -d www.gelani.com -d mail.gelani.com
```

**Or use self-signed certificates for internal use:**
```bash
# Generate self-signed certificate
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/gelani.key \
  -out /etc/ssl/certs/gelani.crt
```

#### 2. HTTPS Configuration for Nginx

Update `/etc/nginx/sites-available/gelani.com`:
```nginx
server {
    listen 80;
    server_name gelani.com www.gelani.com;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name gelani.com www.gelani.com;
    
    ssl_certificate /etc/ssl/certs/gelani.crt;
    ssl_certificate_key /etc/ssl/private/gelani.key;
    
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;
    
    # ... rest of configuration
}
```

#### 3. Secure SMTP (SMTPS - Port 465/587)

Update `/etc/postfix/main.cf`:
```
# TLS settings
smtpd_tls_cert_file=/etc/ssl/certs/gelani.crt
smtpd_tls_key_file=/etc/ssl/private/gelani.key
smtpd_tls_security_level=may
smtpd_tls_auth_only=yes
smtp_tls_security_level=may
```

Update `/etc/postfix/master.cf`:
```
submission inet n       -       y       -       -       smtpd
  -o syslog_name=postfix/submission
  -o smtpd_tls_security_level=encrypt
  -o smtpd_sasl_auth_enable=yes
  -o smtpd_client_restrictions=permit_sasl_authenticated,reject
```

#### 4. Secure IMAP (IMAPS - Port 993)

Update `/etc/dovecot/conf.d/10-ssl.conf`:
```
ssl = required
ssl_cert = </etc/ssl/certs/gelani.crt
ssl_key = </etc/ssl/private/gelani.key
ssl_protocols = !SSLv3 !TLSv1 !TLSv1.1
ssl_cipher_list = ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256
ssl_prefer_server_ciphers = yes
```

Update `/etc/dovecot/conf.d/10-auth.conf`:
```
disable_plaintext_auth = yes
```

#### 5. Firewall Configuration (UFW)

```bash
# Enable UFW
sudo ufw enable

# Allow SSH (if remote access needed)
sudo ufw allow 22/tcp

# Allow DNS
sudo ufw allow 53/tcp
sudo ufw allow 53/udp

# Allow HTTP/HTTPS
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Allow secure mail ports
sudo ufw allow 587/tcp  # SMTP submission
sudo ufw allow 993/tcp  # IMAPS
sudo ufw allow 995/tcp  # POP3S

# Deny insecure ports
sudo ufw deny 25/tcp   # SMTP (allow only for server-to-server)
sudo ufw deny 143/tcp  # IMAP
sudo ufw deny 110/tcp  # POP3

# Check status
sudo ufw status verbose
```

#### 6. Fail2Ban for Brute Force Protection

```bash
# Install Fail2Ban
sudo apt install -y fail2ban

# Copy default configuration
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Edit configuration
sudo nano /etc/fail2ban/jail.local
```

Add these jails:
```ini
[sshd]
enabled = true
port = 22
maxretry = 3
bantime = 3600

[postfix]
enabled = true
port = smtp,465,587
maxretry = 3
bantime = 3600

[dovecot]
enabled = true
port = pop3,pop3s,imap,imaps
maxretry = 3
bantime = 3600

[nginx-http-auth]
enabled = true
port = http,https
maxretry = 3
bantime = 3600
```

```bash
# Start Fail2Ban
sudo systemctl start fail2ban
sudo systemctl enable fail2ban
```

#### 7. DKIM, SPF, and DMARC Configuration

**Install OpenDKIM:**
```bash
sudo apt install -y opendkim opendkim-tools
```

**Generate DKIM keys:**
```bash
sudo mkdir -p /etc/opendkim/keys/gelani.com
sudo opendkim-genkey -D /etc/opendkim/keys/gelani.com/ -d gelani.com -s default
sudo chown -R opendkim:opendkim /etc/opendkim
```

**Add to DNS (example):**
```
; SPF Record
gelani.com.   IN   TXT   "v=spf1 mx ip4:192.168.20.15 -all"

; DKIM Record
default._domainkey.gelani.com.   IN   TXT   "v=DKIM1; k=rsa; p=MIGfMA0GCS..."

; DMARC Record
_dmarc.gelani.com.   IN   TXT   "v=DMARC1; p=quarantine; rua=mailto:admin@gelani.com"
```

#### 8. Regular Updates and Monitoring

```bash
# Enable automatic security updates
sudo apt install -y unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades

# Set up log monitoring
sudo apt install -y logwatch
sudo logwatch --output mail --mailto admin@gelani.com --detail high
```

#### 9. Strong Password Policy

```bash
# Install password quality checking
sudo apt install -y libpam-pwquality

# Edit PAM configuration
sudo nano /etc/pam.d/common-password
```

Add:
```
password requisite pam_pwquality.so retry=3 minlen=12 difok=3 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1
```

#### 10. Backup Strategy

```bash
# Create backup script
sudo nano /usr/local/bin/backup-mail-server.sh
```

```bash
#!/bin/bash
BACKUP_DIR="/backup"
DATE=$(date +%Y%m%d)

# Backup DNS zones
tar -czf $BACKUP_DIR/bind-$DATE.tar.gz /etc/bind/zones

# Backup mail data
tar -czf $BACKUP_DIR/mailboxes-$DATE.tar.gz /home/*/Maildir

# Backup databases
mysqldump --all-databases > $BACKUP_DIR/mysql-$DATE.sql
gzip $BACKUP_DIR/mysql-$DATE.sql

# Backup configuration files
tar -czf $BACKUP_DIR/configs-$DATE.tar.gz \
  /etc/nginx \
  /etc/postfix \
  /etc/dovecot \
  /etc/roundcube

# Remove backups older than 30 days
find $BACKUP_DIR -type f -mtime +30 -delete
```

```bash
# Make executable
sudo chmod +x /usr/local/bin/backup-mail-server.sh

# Add to crontab (daily at 2 AM)
sudo crontab -e
# Add line:
# 0 2 * * * /usr/local/bin/backup-mail-server.sh
```

### Security Checklist for Production

- [ ] SSL/TLS certificates installed and configured
- [ ] HTTPS enabled for all web services
- [ ] SMTPS (port 587) enabled for mail submission
- [ ] IMAPS (port 993) enabled for mail retrieval
- [ ] Plain text authentication disabled
- [ ] UFW firewall enabled and configured
- [ ] Fail2Ban installed and monitoring services
- [ ] DKIM signatures configured
- [ ] SPF records validated
- [ ] DMARC policy implemented
- [ ] Strong password policy enforced
- [ ] Regular security updates automated
- [ ] Backup strategy implemented
- [ ] Log monitoring active
- [ ] Intrusion detection system considered
- [ ] Network access restricted to necessary hosts
- [ ] Unnecessary services disabled
- [ ] Root login disabled (SSH)
- [ ] Regular security audits scheduled

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

## Project Summary

### Achievements
✓ Successfully deployed complete DNS, Web, and Mail infrastructure
✓ Integrated services with proper DNS resolution
✓ Implemented webmail interface for easy access
✓ Created and tested multiple user accounts
✓ Verified cross-service functionality
✓ Documented comprehensive troubleshooting procedures

### Technical Skills Demonstrated
- Linux system administration (Ubuntu 22.04)
- DNS server configuration (BIND9)
- Web server deployment (Nginx)
- Mail server setup (Postfix + Dovecot)
- Database management (MariaDB)
- PHP application integration (Roundcube)
- Network troubleshooting
- Service integration and testing

### Project Metrics
- **Total VMs:** 5 (2 Ubuntu servers + 3 Windows clients)
- **Services Configured:** 6 (BIND9, Nginx, Postfix, Dovecot, MariaDB, PHP-FPM)
- **Configuration Files Modified:** 15+
- **Users Created:** 4
- **Test Emails Sent:** 4+
- **Zero Downtime:** All services running continuously

### Future Enhancements
1. Implement SSL/TLS encryption for all services
2. Configure SPF, DKIM, and DMARC for production
3. Set up automated backups
4. Implement monitoring and alerting
5. Configure fail2ban for security
6. Add spam filtering (SpamAssassin)
7. Implement webmail calendar and contacts
8. Set up external mail relay for internet delivery

---

## Credits and References

### Documentation Sources
- BIND9 Administrator Reference Manual
- Nginx Official Documentation
- Postfix Documentation
- Dovecot Wiki
- Roundcube Documentation
- Ubuntu Server Guide

### Tools and Technologies
- **Ubuntu Server:** 22.04 LTS
- **BIND:** 9.18.28
- **Nginx:** 1.18.0
- **Postfix:** 3.6.4
- **Dovecot:** 2.3.16
- **MariaDB:** 10.6.22
- **PHP:** 8.1
- **Roundcube:** 1.6.0

---

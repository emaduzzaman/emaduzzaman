# Production Security Hardening Guide
## DNS, Web, and Mail Server Infrastructure in PICO PUBLIC Cloud

---

## ⚠️ CRITICAL NOTICE

**This guide is MANDATORY for production deployments.**

The test environment documented in `DNS-Web-Mail-Server-Project-Documentation.md` contains multiple security vulnerabilities and is **NOT safe for production use**. Before deploying any mail, web, or DNS server to production, you **MUST** implement all security measures outlined in this guide.

### What This Guide Covers

- SSL/TLS encryption for all services
- Secure authentication mechanisms
- Firewall configuration and hardening
- Email security (SPF, DKIM, DMARC)
- Intrusion detection and prevention
- Backup and disaster recovery
- Monitoring and alerting
- Security best practices

---

## Table of Contents

1. [Pre-Production Security Assessment](#pre-production-security-assessment)
2. [SSL/TLS Certificate Implementation](#ssltls-certificate-implementation)
3. [Web Server Security (Nginx)](#web-server-security-nginx)
4. [Mail Server Security (Postfix & Dovecot)](#mail-server-security-postfix--dovecot)
5. [DNS Server Security (BIND9)](#dns-server-security-bind9)
6. [Firewall Configuration (UFW)](#firewall-configuration-ufw)
7. [Intrusion Prevention (Fail2Ban)](#intrusion-prevention-fail2ban)
8. [Email Authentication (SPF, DKIM, DMARC)](#email-authentication-spf-dkim-dmarc)
9. [System Hardening](#system-hardening)
10. [Backup Strategy](#backup-strategy)
11. [Monitoring and Alerting](#monitoring-and-alerting)
12. [Ongoing Maintenance](#ongoing-maintenance)
13. [Security Checklist](#security-checklist)

---

## Pre-Production Security Assessment

### Current Vulnerabilities in Test Environment

Before proceeding with production deployment, acknowledge these critical security issues in the test setup:

| Vulnerability | Risk Level | Impact |
|--------------|------------|---------|
| No SSL/TLS encryption | 🔴 CRITICAL | All traffic in plain text, passwords exposed |
| Plain text authentication | 🔴 CRITICAL | Credentials easily intercepted |
| No firewall rules | 🔴 CRITICAL | All ports exposed to attacks |
| No intrusion detection | 🟠 HIGH | Brute force attacks undetected |
| No DKIM signatures | 🟠 HIGH | Emails marked as spam |
| Weak password policy | 🟠 HIGH | Easy to crack passwords |
| No backup system | 🟠 HIGH | Data loss risk |
| No monitoring | 🟡 MEDIUM | Issues go undetected |

## SSL/TLS Certificate Implementation

### Option 1: Let's Encrypt (Recommended for Public Domains)

**Advantages:**
- Free certificates
- Automatic renewal
- Trusted by all browsers
- Easy integration with Nginx

**Prerequisites:**
- Public domain name with DNS properly configured
- Ports 80 and 443 accessible from the internet
- Valid email address for notifications

#### Step 1: Install Certbot

```bash
sudo apt update
sudo apt install -y certbot python3-certbot-nginx
```

#### Step 2: Obtain Certificates

For all domains at once:

```bash
sudo certbot --nginx -d gelani.com -d www.gelani.com -d mail.gelani.com -d ns1.gelani.com
```

For individual domains:

```bash
# Web server certificate
sudo certbot --nginx -d gelani.com -d www.gelani.com

# Mail server certificate
sudo certbot --nginx -d mail.gelani.com
```

#### Step 3: Verify Certificate Installation

```bash
# Check certificate details
sudo certbot certificates

# Test SSL configuration
openssl s_client -connect gelani.com:443 -servername gelani.com
```

#### Step 4: Configure Automatic Renewal

```bash
# Test renewal process
sudo certbot renew --dry-run

# Renewal is automatic via systemd timer
sudo systemctl status certbot.timer
```

### Option 2: Self-Signed Certificates (Internal Networks Only)

**Use Case:** Internal-only deployments where Let's Encrypt is not feasible.

**⚠️ WARNING:** Self-signed certificates will trigger browser warnings and are NOT suitable for public-facing services.

#### Generate Self-Signed Certificate

```bash
# Create directory for certificates
sudo mkdir -p /etc/ssl/private
sudo chmod 700 /etc/ssl/private

# Generate certificate (valid for 365 days)
sudo openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
  -keyout /etc/ssl/private/gelani.key \
  -out /etc/ssl/certs/gelani.crt

# Set proper permissions
sudo chmod 600 /etc/ssl/private/gelani.key
sudo chmod 644 /etc/ssl/certs/gelani.crt
```

Interactive prompts:
```
Country Name: BD
State: Dhaka
Locality: Dhaka
Organization Name: Your Organization
Organizational Unit: IT
Common Name: gelani.com
Email Address: admin@gelani.com
```

#### Generate Wildcard Certificate (All Subdomains)

```bash
sudo openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
  -keyout /etc/ssl/private/gelani-wildcard.key \
  -out /etc/ssl/certs/gelani-wildcard.crt \
  -subj "/C=BD/ST=Dhaka/L=Dhaka/O=YourOrg/CN=*.gelani.com"
```

### Option 3: Commercial Certificate Authority

**Use Case:** Enterprise deployments requiring extended validation (EV) certificates.

**Providers:** DigiCert, GlobalSign, Sectigo, etc.

**Process:**
1. Generate Certificate Signing Request (CSR)
2. Purchase certificate from CA
3. Complete domain validation
4. Install provided certificate and intermediate chain

---

## Web Server Security (Nginx)

### HTTPS Configuration

#### Primary Website (gelani.com)

Replace `/etc/nginx/sites-available/gelani.com`:

```nginx
# HTTP to HTTPS redirect
server {
    listen 80;
    listen [::]:80;
    server_name gelani.com www.gelani.com;
    
    # Redirect all HTTP to HTTPS
    return 301 https://$server_name$request_uri;
}

# HTTPS server
server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name gelani.com www.gelani.com;
    
    # SSL Certificate (Let's Encrypt)
    ssl_certificate /etc/letsencrypt/live/gelani.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/gelani.com/privkey.pem;
    
    # For self-signed certificates, use:
    # ssl_certificate /etc/ssl/certs/gelani.crt;
    # ssl_certificate_key /etc/ssl/private/gelani.key;
    
    # SSL Configuration - Modern (Secure)
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers 'ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384';
    ssl_prefer_server_ciphers off;
    
    # SSL Session Settings
    ssl_session_timeout 1d;
    ssl_session_cache shared:SSL:50m;
    ssl_session_tickets off;
    
    # OCSP Stapling (Let's Encrypt)
    ssl_stapling on;
    ssl_stapling_verify on;
    ssl_trusted_certificate /etc/letsencrypt/live/gelani.com/chain.pem;
    
    # Security Headers
    add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload" always;
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;
    add_header Referrer-Policy "no-referrer-when-downgrade" always;
    add_header Content-Security-Policy "default-src 'self' http: https: data: blob: 'unsafe-inline'" always;
    
    # Document Root
    root /var/www/gelani.com/html;
    index index.html index.htm;
    
    # Logging
    access_log /var/log/nginx/gelani.com.access.log;
    error_log /var/log/nginx/gelani.com.error.log;
    
    # Main location
    location / {
        try_files $uri $uri/ =404;
    }
    
    # Deny access to hidden files
    location ~ /\. {
        deny all;
        access_log off;
        log_not_found off;
    }
}
```

#### Webmail (mail.gelani.com)

Replace `/etc/nginx/sites-available/mail.gelani.com`:

```nginx
# HTTP to HTTPS redirect
server {
    listen 80;
    listen [::]:80;
    server_name mail.gelani.com;
    return 301 https://$server_name$request_uri;
}

# HTTPS server
server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name mail.gelani.com;
    
    # SSL Certificate
    ssl_certificate /etc/letsencrypt/live/mail.gelani.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/mail.gelani.com/privkey.pem;
    
    # SSL Configuration
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers 'ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384';
    ssl_prefer_server_ciphers off;
    ssl_session_timeout 1d;
    ssl_session_cache shared:SSL:50m;
    ssl_session_tickets off;
    
    # Security Headers
    add_header Strict-Transport-Security "max-age=63072000" always;
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;
    
    # Roundcube Root
    root /usr/share/roundcube;
    index index.php index.html;
    
    # Logging
    access_log /var/log/nginx/mail.gelani.com.access.log;
    error_log /var/log/nginx/mail.gelani.com.error.log;
    
    # Main location
    location / {
        try_files $uri $uri/ /index.php?$args;
    }
    
    # PHP processing
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
        
        # Security parameters
        fastcgi_param HTTPS on;
        fastcgi_param HTTP_SCHEME https;
    }
    
    # Deny access to sensitive directories
    location ~* ^/(bin|SQL|config|temp|logs|vendor)/ {
        deny all;
    }
    
    # Deny access to hidden files
    location ~ /\. {
        deny all;
        access_log off;
        log_not_found off;
    }
    
    # Rate limiting for login
    location ~ ^/(index.php)?$ {
        limit_req zone=login burst=5 nodelay;
        try_files $uri $uri/ /index.php?$args;
    }
}
```

### Additional Nginx Security

#### Rate Limiting Configuration

Add to `/etc/nginx/nginx.conf` in the `http` block:

```nginx
http {
    # Rate limiting zones
    limit_req_zone $binary_remote_addr zone=login:10m rate=5r/m;
    limit_req_zone $binary_remote_addr zone=general:10m rate=30r/m;
    
    # Connection limiting
    limit_conn_zone $binary_remote_addr zone=addr:10m;
    limit_conn addr 10;
    
    # ... rest of configuration
}
```

#### Test and Reload Nginx

```bash
# Test configuration
sudo nginx -t

# Reload Nginx
sudo systemctl reload nginx

# Verify HTTPS is working
curl -I https://gelani.com
curl -I https://mail.gelani.com
```

---

## Mail Server Security (Postfix & Dovecot)

### Postfix Security Configuration

#### SSL/TLS for SMTP

Edit `/etc/postfix/main.cf`:

```bash
# TLS Parameters
smtpd_tls_cert_file=/etc/letsencrypt/live/mail.gelani.com/fullchain.pem
smtpd_tls_key_file=/etc/letsencrypt/live/mail.gelani.com/privkey.pem
smtpd_tls_security_level=may
smtpd_tls_auth_only=yes
smtpd_tls_loglevel=1
smtpd_tls_received_header=yes
smtpd_tls_session_cache_database = btree:${data_directory}/smtpd_scache

smtp_tls_security_level=may
smtp_tls_session_cache_database = btree:${data_directory}/smtp_scache
smtp_tls_loglevel=1

# TLS Protocol Settings
smtpd_tls_mandatory_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
smtpd_tls_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
smtp_tls_mandatory_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1
smtp_tls_protocols = !SSLv2, !SSLv3, !TLSv1, !TLSv1.1

# Cipher Configuration
smtpd_tls_mandatory_ciphers = high
tls_high_cipherlist = ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384

# SASL Authentication
smtpd_sasl_auth_enable = yes
smtpd_sasl_type = dovecot
smtpd_sasl_path = private/auth
smtpd_sasl_security_options = noanonymous
smtpd_sasl_local_domain = $myhostname
broken_sasl_auth_clients = yes

# Restriction Lists
smtpd_helo_required = yes
smtpd_helo_restrictions = 
    permit_mynetworks,
    permit_sasl_authenticated,
    reject_invalid_helo_hostname,
    reject_non_fqdn_helo_hostname

smtpd_sender_restrictions = 
    permit_mynetworks,
    permit_sasl_authenticated,
    reject_non_fqdn_sender,
    reject_unknown_sender_domain

smtpd_recipient_restrictions = 
    permit_mynetworks,
    permit_sasl_authenticated,
    reject_non_fqdn_recipient,
    reject_unknown_recipient_domain,
    reject_unauth_destination,
    reject_rbl_client zen.spamhaus.org,
    reject_rbl_client bl.spamcop.net

# Additional Security
disable_vrfy_command = yes
smtpd_discard_ehlo_keywords = chunking, silent-discard
```

#### Configure Submission Port (587)

Edit `/etc/postfix/master.cf`:

```bash
# Secure SMTP Submission (Port 587)
submission inet n       -       y       -       -       smtpd
  -o syslog_name=postfix/submission
  -o smtpd_tls_security_level=encrypt
  -o smtpd_sasl_auth_enable=yes
  -o smtpd_tls_auth_only=yes
  -o smtpd_reject_unlisted_recipient=no
  -o smtpd_client_restrictions=permit_sasl_authenticated,reject
  -o smtpd_helo_restrictions=permit_mynetworks,permit_sasl_authenticated,reject
  -o smtpd_sender_restrictions=permit_mynetworks,permit_sasl_authenticated,reject
  -o smtpd_recipient_restrictions=permit_sasl_authenticated,reject_unauth_destination
  -o milter_macro_daemon_name=ORIGINATING

# SMTPS (Port 465) - Optional
smtps     inet  n       -       y       -       -       smtpd
  -o syslog_name=postfix/smtps
  -o smtpd_tls_wrappermode=yes
  -o smtpd_sasl_auth_enable=yes
  -o smtpd_reject_unlisted_recipient=no
  -o smtpd_client_restrictions=permit_sasl_authenticated,reject
  -o smtpd_recipient_restrictions=permit_sasl_authenticated,reject
  -o milter_macro_daemon_name=ORIGINATING
```

#### Restart Postfix

```bash
sudo postfix check
sudo systemctl restart postfix
sudo systemctl status postfix
```

### Dovecot Security Configuration

#### SSL/TLS for IMAP/POP3

Edit `/etc/dovecot/conf.d/10-ssl.conf`:

```bash
# SSL/TLS support: yes, no, required
ssl = required

# SSL certificates
ssl_cert = </etc/letsencrypt/live/mail.gelani.com/fullchain.pem
ssl_key = </etc/letsencrypt/live/mail.gelani.com/privkey.pem

# For self-signed certificates:
# ssl_cert = </etc/ssl/certs/gelani.crt
# ssl_key = </etc/ssl/private/gelani.key

# SSL protocols and ciphers
ssl_min_protocol = TLSv1.2
ssl_cipher_list = ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384
ssl_prefer_server_ciphers = yes

# SSL/TLS DH parameters
ssl_dh = </etc/dovecot/dh.pem

# Additional security
ssl_options = no_compression
```

#### Generate DH Parameters

```bash
sudo openssl dhparam -out /etc/dovecot/dh.pem 4096
```

This will take several minutes. For faster generation (less secure):

```bash
sudo openssl dhparam -out /etc/dovecot/dh.pem 2048
```

#### Enforce Authentication

Edit `/etc/dovecot/conf.d/10-auth.conf`:

```bash
# Require authentication to be secure (no plain text over non-SSL)
disable_plaintext_auth = yes

# Authentication mechanisms
auth_mechanisms = plain login

# Password database
!include auth-system.conf.ext
```

#### Configure Secure Ports

Edit `/etc/dovecot/conf.d/10-master.conf`:

```bash
service imap-login {
  # Disable non-SSL IMAP (port 143)
  inet_listener imap {
    port = 0
  }
  
  # Enable SSL IMAP (port 993)
  inet_listener imaps {
    port = 993
    ssl = yes
  }
}

service pop3-login {
  # Disable non-SSL POP3 (port 110)
  inet_listener pop3 {
    port = 0
  }
  
  # Enable SSL POP3 (port 995)
  inet_listener pop3s {
    port = 995
    ssl = yes
  }
}

# Postfix SASL Auth
service auth {
  unix_listener /var/spool/postfix/private/auth {
    mode = 0660
    user = postfix
    group = postfix
  }
}
```

#### Restart Dovecot

```bash
sudo doveconf -n  # Check configuration
sudo systemctl restart dovecot
sudo systemctl status dovecot
```

### Update Roundcube Configuration

Edit `/etc/roundcube/config.inc.php`:

```php
<?php

// IMAP Configuration - Secure
$config['default_host'] = 'ssl://mail.gelani.com';
$config['default_port'] = 993;
$config['imap_auth_type'] = null;

// SMTP Configuration - Secure
$config['smtp_server'] = 'tls://mail.gelani.com';
$config['smtp_port'] = 587;
$config['smtp_user'] = '%u';
$config['smtp_pass'] = '%p';
$config['smtp_auth_type'] = 'LOGIN';

// Force HTTPS
$config['force_https'] = true;

// ... rest of configuration
?>
```

Restart services:

```bash
sudo systemctl restart php8.1-fpm
sudo systemctl restart nginx
```

---

## DNS Server Security (BIND9)

### Secure BIND9 Configuration

Edit `/etc/bind/named.conf.options`:

```bind
options {
    directory "/var/cache/bind";
    
    // Recursion - Limited to trusted networks only
    recursion yes;
    allow-recursion { 
        localhost; 
        192.168.20.0/24;
        // Add other trusted networks
    };
    
    // Query restrictions
    allow-query { 
        localhost; 
        192.168.20.0/24;
        // Add other authorized networks
    };
    
    // Zone transfer restrictions
    allow-transfer { none; };
    
    // Forwarders
    forwarders {
        8.8.8.8;
        8.8.4.4;
        1.1.1.1;
    };
    
    // DNSSEC
    dnssec-validation auto;
    
    // Rate limiting (DDoS protection)
    rate-limit {
        responses-per-second 10;
        window 5;
    };
    
    // Hide version information
    version none;
    hostname none;
    server-id none;
    
    // Listen on specific interfaces only
    listen-on { 127.0.0.1; 192.168.20.20; };
    listen-on-v6 { ::1; };
    
    // Logging
    querylog yes;
};
```

### Enable DNSSEC for Zones

```bash
# Generate zone signing keys
cd /etc/bind/zones

# Zone Signing Key (ZSK)
sudo dnssec-keygen -a RSASHA256 -b 2048 -n ZONE gelani.com

# Key Signing Key (KSK)
sudo dnssec-keygen -a RSASHA256 -b 4096 -f KSK -n ZONE gelani.com

# Sign the zone
sudo dnssec-signzone -A -3 $(head -c 1000 /dev/random | sha1sum | cut -b 1-16) \
  -N INCREMENT -o gelani.com -t db.gelani.com

# Update named.conf.local
sudo nano /etc/bind/named.conf.local
```

Add to zone configuration:

```bind
zone "gelani.com" {
    type master;
    file "/etc/bind/zones/db.gelani.com.signed";
    allow-transfer { none; };
};
```

Restart BIND9:

```bash
sudo named-checkconf
sudo systemctl restart bind9
```

### DNS Query Logging

Enable query logging for security monitoring:

```bash
sudo rndc querylog on
```

View logs:

```bash
sudo tail -f /var/log/syslog | grep named
```

---

## Firewall Configuration (UFW)

### Initial UFW Setup

```bash
# Ensure UFW is installed
sudo apt install -y ufw

# Set default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

### DNS Server (192.168.20.20) Firewall Rules

```bash
# SSH (if needed)
sudo ufw allow 22/tcp comment 'SSH'

# DNS
sudo ufw allow 53/tcp comment 'DNS TCP'
sudo ufw allow 53/udp comment 'DNS UDP'

# From specific networks only (more restrictive)
# sudo ufw allow from 192.168.20.0/24 to any port 53 proto tcp
# sudo ufw allow from 192.168.20.0/24 to any port 53 proto udp

# Enable firewall
sudo ufw enable
sudo ufw status verbose
```

### Web/Mail Server (192.168.20.15) Firewall Rules

```bash
# SSH (if needed)
sudo ufw allow 22/tcp comment 'SSH'

# HTTP and HTTPS
sudo ufw allow 80/tcp comment 'HTTP'
sudo ufw allow 443/tcp comment 'HTTPS'

# Mail Submission (SMTP with STARTTLS)
sudo ufw allow 587/tcp comment 'SMTP Submission'

# SMTPS (Optional)
sudo ufw allow 465/tcp comment 'SMTPS'

# IMAPS
sudo ufw allow 993/tcp comment 'IMAPS'

# POP3S (if needed)
sudo ufw allow 995/tcp comment 'POP3S'

# SMTP for server-to-server (limit to known mail servers if possible)
sudo ufw allow 25/tcp comment 'SMTP'

# Deny insecure ports explicitly
sudo ufw deny 143/tcp comment 'Block IMAP'
sudo ufw deny 110/tcp comment 'Block POP3'

# Enable firewall
sudo ufw enable
sudo ufw status numbered
```

### Advanced UFW Rules

#### Rate Limiting (Anti-DDoS)

```bash
# Rate limit SSH
sudo ufw limit 22/tcp comment 'SSH rate limit'

# Rate limit HTTPS
sudo ufw limit 443/tcp comment 'HTTPS rate limit'
```

#### Country-Based Blocking (Optional)

Requires geoip modules:

```bash
sudo apt install -y geoip-database geoip-bin

# Block specific countries (example)
# sudo ufw deny from {country-ip-range} to any
```

### Firewall Management Commands

```bash
# View all rules with numbers
sudo ufw status numbered

# Delete a rule by number
sudo ufw delete [number]

# Disable firewall (temporary)
sudo ufw disable

# Reset firewall (remove all rules)
sudo ufw reset

# Reload rules
sudo ufw reload
```

---

## Intrusion Prevention (Fail2Ban)

### Install Fail2Ban

```bash
sudo apt update
sudo apt install -y fail2ban
```

### Configure Fail2Ban

#### Create Local Configuration

```bash
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo nano /etc/fail2ban/jail.local
```

#### Default Settings

Add/modify in `[DEFAULT]` section:

```ini
[DEFAULT]
# Ban settings
bantime  = 3600         # 1 hour ban
findtime = 600          # 10 minute window
maxretry = 3            # 3 attempts before ban

# Action
banaction = ufw
action = %(action_mwl)s

# Email notifications (configure if needed)
destemail = admin@gelani.com
sendername = Fail2Ban
mta = sendmail
```

#### SSH Protection

```ini
[sshd]
enabled = true
port = 22
filter = sshd
logpath = /var/log/auth.log
maxretry = 3
bantime = 3600
```

#### Nginx Protection

```ini
[nginx-http-auth]
enabled = true
port = http,https
filter = nginx-http-auth
logpath = /var/log/nginx/*error.log
maxretry = 3
bantime = 3600

[nginx-noscript]
enabled = true
port = http,https
filter = nginx-noscript
logpath = /var/log/nginx/*access.log
maxretry = 6
bantime = 3600

[nginx-badbots]
enabled = true
port = http,https
filter = nginx-badbots
logpath = /var/log/nginx/*access.log
maxretry = 2
bantime = 86400

[nginx-noproxy]
enabled = true
port = http,https
filter = nginx-noproxy
logpath = /var/log/nginx/*access.log
maxretry = 2
bantime = 86400
```

#### Postfix Protection

```ini
[postfix]
enabled = true
port = smtp,465,587
filter = postfix
logpath = /var/log/mail.log
maxretry = 3
bantime = 3600

[postfix-sasl]
enabled = true
port = smtp,465,587
filter = postfix-sasl
logpath = /var/log/mail.log
maxretry = 3
bantime = 3600
```

#### Dovecot Protection

```ini
[dovecot]
enabled = true
port = pop3,pop3s,imap,imaps,submission,465,sieve
filter = dovecot
logpath = /var/log/mail.log
maxretry = 3
bantime = 3600
```

#### Roundcube Protection

Create filter: `/etc/fail2ban/filter.d/roundcube.conf`

```ini
[Definition]
failregex = IMAP Error: Login failed for .* from <HOST>
            Login failed for .* from <HOST>
ignoreregex =
```

Add jail in `/etc/fail2ban/jail.local`:

```ini
[roundcube]
enabled = true
port = http,https
filter = roundcube
logpath = /var/log/roundcube/errors.log
maxretry = 3
bantime = 3600
```

### Start and Enable Fail2Ban

```bash
# Test configuration
sudo fail2ban-client -t

# Start service
sudo systemctl start fail2ban
sudo systemctl enable fail2ban
sudo systemctl status fail2ban
```

### Fail2Ban Management Commands

```bash
# View status of all jails
sudo fail2ban-client status

# View specific jail status
sudo fail2ban-client status sshd

# Unban an IP address
sudo fail2ban-client set sshd unbanip 192.168.20.50

# Ban an IP address manually
sudo fail2ban-client set sshd banip 192.168.20.50

# View banned IPs
sudo fail2ban-client get sshd banip --with-time

# Reload Fail2Ban
sudo fail2ban-client reload
```

---

## Email Authentication (SPF, DKIM, DMARC)

### SPF (Sender Policy Framework)

SPF prevents email spoofing by specifying which servers can send email for your domain.

#### Add SPF Record to DNS

Edit `/etc/bind/zones/db.gelani.com`:

```bind
; SPF Record
@       IN      TXT     "v=spf1 mx ip4:192.168.20.15 a:mail.gelani.com -all"

; Explanation:
; v=spf1       - SPF version 1
; mx           - Allow MX record servers
; ip4:x.x.x.x  - Allow specific IP
; a:hostname   - Allow A record hostname
; -all         - Fail all others (strict)
; ~all         - Soft fail (recommended for testing)
```

#### Test SPF Record

```bash
dig gelani.com TXT
nslookup -type=TXT gelani.com
```

### DKIM (DomainKeys Identified Mail)

DKIM adds a digital signature to emails, proving they came from your domain.

#### Install OpenDKIM

```bash
sudo apt install -y opendkim opendkim-tools
```

#### Configure OpenDKIM

Edit `/etc/opendkim.conf`:

```bash
# Log to syslog
Syslog yes
SyslogSuccess yes
LogWhy yes

# Required to use local socket with MTAs that access the socket as a non-
# privileged user (e.g. Postfix)
UMask 002

# Sign for all domains
Domain gelani.com
KeyFile /etc/opendkim/keys/gelani.com/default.private
Selector default

# Commonly-used options
Canonicalization relaxed/simple
Mode sv
SubDomains no
AutoRestart yes
AutoRestartRate 10/1M
Background yes
DNSTimeout 5
SignatureAlgorithm rsa-sha256

# Socket for Postfix
Socket inet:8891@localhost
```

#### Generate DKIM Keys

```bash
# Create directory
sudo mkdir -p /etc/opendkim/keys/gelani.com

# Generate keys
sudo opendkim-genkey -b 2048 -d gelani.com -D /etc/opendkim/keys/gelani.com -s default -v

# Set ownership
sudo chown -R opendkim:opendkim /etc/opendkim
sudo chmod 600 /etc/opendkim/keys/gelani.com/default.private
```

#### View DKIM Public Key

```bash
sudo cat /etc/opendkim/keys/gelani.com/default.txt
```

Output example:

```
default._domainkey IN TXT "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA..." ; ----- DKIM key default for gelani.com
```

#### Add DKIM Record to DNS

Edit `/etc/bind/zones/db.gelani.com`:

```bind
; DKIM Record (split long lines as needed)
default._domainkey  IN  TXT  ( "v=DKIM1; k=rsa; "
                                "p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA..."
                                "continuation_of_key_here" )
```

**Note:** The actual key will be much longer. You can split it across multiple quoted strings.

#### Configure Postfix to Use OpenDKIM

Edit `/etc/postfix/main.cf`:

```bash
# OpenDKIM
milter_default_action = accept
milter_protocol = 6
smtpd_milters = inet:localhost:8891
non_smtpd_milters = $smtpd_milters
```

#### Start OpenDKIM

```bash
sudo systemctl start opendkim
sudo systemctl enable opendkim
sudo systemctl status opendkim
```

#### Restart Postfix

```bash
sudo systemctl restart postfix
```

#### Test DKIM

Send a test email and check headers, or use:

```bash
sudo opendkim-testkey -d gelani.com -s default -vvv
```

### DMARC (Domain-based Message Authentication)

DMARC builds on SPF and DKIM, telling receivers what to do with failed authentication.

#### Add DMARC Record to DNS

Edit `/etc/bind/zones/db.gelani.com`:

```bind
; DMARC Record
_dmarc  IN  TXT  "v=DMARC1; p=quarantine; rua=mailto:dmarc@gelani.com; ruf=mailto:dmarc@gelani.com; fo=1; pct=100"

; Explanation:
; v=DMARC1                   - Version
; p=quarantine               - Policy (none/quarantine/reject)
; rua=mailto:email           - Aggregate reports
; ruf=mailto:email           - Forensic reports
; fo=1                       - Reporting options
; pct=100                    - Percentage of messages to check
```

**Policy Options:**
- `p=none` - Monitor only (recommended for initial setup)
- `p=quarantine` - Mark as spam
- `p=reject` - Reject the message

#### Reload DNS

```bash
sudo systemctl restart bind9
```

#### Test DMARC

```bash
dig _dmarc.gelani.com TXT
```

### Email Authentication Testing

#### Online Testing Tools

1. **Mail-Tester** (https://www.mail-tester.com)
   - Send email to provided address
   - Receive comprehensive score and recommendations

2. **MXToolbox** (https://mxtoolbox.com/dmarc.aspx)
   - Check SPF, DKIM, DMARC records
   - Verify DNS configuration

3. **DMARC Analyzer**
   - Monitor DMARC reports
   - Track authentication failures

#### Manual Testing

```bash
# Send test email with all headers
echo "Test email body" | mail -s "DKIM Test" -a "From: test@gelani.com" recipient@example.com

# Check mail logs
sudo tail -f /var/log/mail.log | grep -i dkim
```

---

## System Hardening

### SSH Hardening

Edit `/etc/ssh/sshd_config`:

```bash
# Disable root login
PermitRootLogin no

# Use SSH protocol 2 only
Protocol 2

# Disable password authentication (use keys only)
PasswordAuthentication no
PermitEmptyPasswords no

# Allow specific users only
AllowUsers ubuntu nahid-101

# Disable X11 forwarding
X11Forwarding no

# Set login grace time
LoginGraceTime 30

# Maximum authentication attempts
MaxAuthTries 3

# Idle timeout
ClientAliveInterval 300
ClientAliveCountMax 2

# Disable unused authentication methods
ChallengeResponseAuthentication no
KerberosAuthentication no
GSSAPIAuthentication no
```

Restart SSH:

```bash
sudo systemctl restart sshd
```

### Password Policy

Install password quality checking:

```bash
sudo apt install -y libpam-pwquality
```

Edit `/etc/security/pwquality.conf`:

```bash
# Minimum password length
minlen = 14

# Require at least one digit
dcredit = -1

# Require at least one uppercase
ucredit = -1

# Require at least one lowercase
lcredit = -1

# Require at least one special character
ocredit = -1

# Number of characters that must be different from old password
difok = 3

# Check against dictionary
dictcheck = 1

# Maximum number of same consecutive characters
maxrepeat = 3

# Reject passwords containing username
usercheck = 1
```

Edit `/etc/pam.d/common-password`:

```bash
password requisite pam_pwquality.so retry=3
```

### Account Lockout Policy

Edit `/etc/pam.d/common-auth`:

```bash
# Lock account after 5 failed attempts for 10 minutes
auth required pam_tally2.so onerr=fail audit silent deny=5 unlock_time=600
```

View locked accounts:

```bash
sudo pam_tally2 --user=username
```

Unlock account:

```bash
sudo pam_tally2 --user=username --reset
```

### Disable Unnecessary Services

```bash
# List all enabled services
systemctl list-unit-files --state=enabled

# Disable unnecessary services (examples)
sudo systemctl disable bluetooth.service
sudo systemctl disable cups.service
sudo systemctl disable avahi-daemon.service
```

### Automatic Security Updates

```bash
# Install unattended-upgrades
sudo apt install -y unattended-upgrades apt-listchanges

# Enable automatic updates
sudo dpkg-reconfigure -plow unattended-upgrades
```

Edit `/etc/apt/apt.conf.d/50unattended-upgrades`:

```bash
Unattended-Upgrade::Allowed-Origins {
        "${distro_id}:${distro_codename}-security";
        "${distro_id}ESMApps:${distro_codename}-apps-security";
        "${distro_id}ESM:${distro_codename}-infra-security";
};

Unattended-Upgrade::AutoFixInterruptedDpkg "true";
Unattended-Upgrade::MinimalSteps "true";
Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";
Unattended-Upgrade::Remove-Unused-Dependencies "true";
Unattended-Upgrade::Automatic-Reboot "false";
Unattended-Upgrade::Automatic-Reboot-Time "03:00";

Unattended-Upgrade::Mail "admin@gelani.com";
Unattended-Upgrade::MailReport "on-change";
```

### File System Security

#### Secure /tmp

Edit `/etc/fstab` and add:

```bash
tmpfs /tmp tmpfs defaults,noexec,nosuid,nodev 0 0
tmpfs /var/tmp tmpfs defaults,noexec,nosuid,nodev 0 0
```

Remount:

```bash
sudo mount -o remount /tmp
sudo mount -o remount /var/tmp
```

#### Disable Core Dumps

Edit `/etc/security/limits.conf`:

```bash
* hard core 0
```

Edit `/etc/sysctl.conf`:

```bash
fs.suid_dumpable = 0
```

Apply:

```bash
sudo sysctl -p
```

### Kernel Hardening

Edit `/etc/sysctl.conf`:

```bash
# IP Forwarding (disable if not needed)
net.ipv4.ip_forward = 0

# Syncookies (protect against SYN flood)
net.ipv4.tcp_syncookies = 1

# Ignore ICMP redirects
net.ipv4.conf.all.accept_redirects = 0
net.ipv6.conf.all.accept_redirects = 0

# Ignore send redirects
net.ipv4.conf.all.send_redirects = 0

# Disable source packet routing
net.ipv4.conf.all.accept_source_route = 0
net.ipv6.conf.all.accept_source_route = 0

# Log Martians
net.ipv4.conf.all.log_martians = 1

# Ignore ICMP ping requests
net.ipv4.icmp_echo_ignore_all = 0

# Ignore broadcast ping
net.ipv4.icmp_echo_ignore_broadcasts = 1

# Protection against bad ICMP
net.ipv4.icmp_ignore_bogus_error_responses = 1

# Reverse path filtering
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1
```

Apply settings:

```bash
sudo sysctl -p
```

---

## Backup Strategy

### Backup Script

Create `/usr/local/bin/backup-mail-server.sh`:

```bash
#!/bin/bash

##############################################
# Mail Server Backup Script
# Backs up DNS zones, mail data, databases, and configs
##############################################

# Configuration
BACKUP_DIR="/backup"
DATE=$(date +%Y%m%d_%H%M%S)
RETENTION_DAYS=30
LOG_FILE="/var/log/backup.log"

# Email notifications
ADMIN_EMAIL="admin@gelani.com"
HOSTNAME=$(hostname)

# Create backup directory
mkdir -p $BACKUP_DIR

# Logging function
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a $LOG_FILE
}

log "Starting backup process..."

# 1. Backup BIND9 DNS zones
log "Backing up DNS zones..."
tar -czf $BACKUP_DIR/bind-$DATE.tar.gz /etc/bind/zones /etc/bind/*.conf 2>/dev/null
if [ $? -eq 0 ]; then
    log "DNS zones backup completed successfully"
else
    log "ERROR: DNS zones backup failed"
fi

# 2. Backup mail directories (Maildir)
log "Backing up mail data..."
tar -czf $BACKUP_DIR/mailboxes-$DATE.tar.gz /home/*/Maildir 2>/dev/null
if [ $? -eq 0 ]; then
    log "Mail data backup completed successfully"
else
    log "ERROR: Mail data backup failed"
fi

# 3. Backup MariaDB databases
log "Backing up databases..."
mysqldump --all-databases --single-transaction --quick --lock-tables=false > $BACKUP_DIR/mysql-$DATE.sql 2>/dev/null
if [ $? -eq 0 ]; then
    gzip $BACKUP_DIR/mysql-$DATE.sql
    log "Database backup completed successfully"
else
    log "ERROR: Database backup failed"
fi

# 4. Backup Postfix configuration
log "Backing up Postfix configuration..."
tar -czf $BACKUP_DIR/postfix-$DATE.tar.gz /etc/postfix 2>/dev/null

# 5. Backup Dovecot configuration
log "Backing up Dovecot configuration..."
tar -czf $BACKUP_DIR/dovecot-$DATE.tar.gz /etc/dovecot 2>/dev/null

# 6. Backup Nginx configuration
log "Backing up Nginx configuration..."
tar -czf $BACKUP_DIR/nginx-$DATE.tar.gz /etc/nginx /var/www 2>/dev/null

# 7. Backup Roundcube configuration
log "Backing up Roundcube configuration..."
tar -czf $BACKUP_DIR/roundcube-$DATE.tar.gz /etc/roundcube 2>/dev/null

# 8. Backup SSL certificates
log "Backing up SSL certificates..."
tar -czf $BACKUP_DIR/ssl-$DATE.tar.gz /etc/letsencrypt /etc/ssl/private /etc/ssl/certs 2>/dev/null

# 9. Create manifest file
log "Creating backup manifest..."
cat > $BACKUP_DIR/manifest-$DATE.txt <<EOF
Backup Date: $(date)
Hostname: $HOSTNAME
Backup Files:
$(ls -lh $BACKUP_DIR/*-$DATE.* 2>/dev/null)

Total Backup Size: $(du -sh $BACKUP_DIR | cut -f1)
EOF

# 10. Remove old backups (older than retention period)
log "Removing backups older than $RETENTION_DAYS days..."
find $BACKUP_DIR -type f -name "*.tar.gz" -mtime +$RETENTION_DAYS -delete
find $BACKUP_DIR -type f -name "*.sql.gz" -mtime +$RETENTION_DAYS -delete
find $BACKUP_DIR -type f -name "*.txt" -mtime +$RETENTION_DAYS -delete

# 11. Calculate total backup size
BACKUP_SIZE=$(du -sh $BACKUP_DIR | cut -f1)
log "Backup process completed. Total backup size: $BACKUP_SIZE"

# 12. Send email notification
if command -v mail &> /dev/null; then
    mail -s "Backup Completed - $HOSTNAME" $ADMIN_EMAIL <<EOF
Backup completed successfully on $HOSTNAME

Date: $(date)
Total Backup Size: $BACKUP_SIZE

Recent backups:
$(ls -lh $BACKUP_DIR/*-$DATE.* 2>/dev/null)

Full log: $LOG_FILE
EOF
fi

log "Backup script finished"
exit 0
```

### Set Permissions and Schedule

```bash
# Make executable
sudo chmod +x /usr/local/bin/backup-mail-server.sh

# Test the script
sudo /usr/local/bin/backup-mail-server.sh

# Schedule daily backups at 2 AM
sudo crontab -e
```

Add to crontab:

```bash
# Daily backup at 2:00 AM
0 2 * * * /usr/local/bin/backup-mail-server.sh

# Weekly full backup on Sunday at 3:00 AM
0 3 * * 0 /usr/local/bin/backup-mail-server.sh
```

### Backup to Remote Location

#### Using rsync over SSH

```bash
# Create remote backup script
sudo nano /usr/local/bin/remote-backup.sh
```

```bash
#!/bin/bash

BACKUP_DIR="/backup"
REMOTE_USER="backup"
REMOTE_HOST="backup.example.com"
REMOTE_DIR="/backups/gelani-mail"

# Sync backups to remote server
rsync -avz --delete \
  -e "ssh -i /root/.ssh/backup_key" \
  $BACKUP_DIR/ \
  $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/

if [ $? -eq 0 ]; then
    logger "Remote backup completed successfully"
else
    logger "ERROR: Remote backup failed"
fi
```

Make executable:

```bash
sudo chmod +x /usr/local/bin/remote-backup.sh
```

Schedule after local backup:

```bash
# Remote backup at 4:00 AM (after local backup completes)
0 4 * * * /usr/local/bin/remote-backup.sh
```

### Restore Procedures

#### Restore DNS Zones

```bash
sudo tar -xzf /backup/bind-YYYYMMDD_HHMMSS.tar.gz -C /
sudo systemctl restart bind9
```

#### Restore Mail Data

```bash
sudo tar -xzf /backup/mailboxes-YYYYMMDD_HHMMSS.tar.gz -C /
sudo chown -R username:username /home/username/Maildir
```

#### Restore Database

```bash
gunzip < /backup/mysql-YYYYMMDD_HHMMSS.sql.gz | mysql -u root
sudo systemctl restart mariadb
```

#### Restore Configuration

```bash
# Postfix
sudo tar -xzf /backup/postfix-YYYYMMDD_HHMMSS.tar.gz -C /
sudo systemctl restart postfix

# Dovecot
sudo tar -xzf /backup/dovecot-YYYYMMDD_HHMMSS.tar.gz -C /
sudo systemctl restart dovecot

# Nginx
sudo tar -xzf /backup/nginx-YYYYMMDD_HHMMSS.tar.gz -C /
sudo systemctl restart nginx
```

---

## Monitoring and Alerting

### System Monitoring with Netdata

```bash
# Install Netdata
bash <(curl -Ss https://my-netdata.io/kickstart.sh)

# Access via browser
# http://your-server-ip:19999
```

### Log Monitoring with Logwatch

```bash
# Install Logwatch
sudo apt install -y logwatch

# Configure Logwatch
sudo cp /usr/share/logwatch/default.conf/logwatch.conf /etc/logwatch/conf/

# Edit configuration
sudo nano /etc/logwatch/conf/logwatch.conf
```

Configure:

```bash
MailTo = admin@gelani.com
MailFrom = logwatch@gelani.com
Detail = High
Service = All
Range = yesterday
Format = html
```

Test:

```bash
sudo logwatch --detail High --mailto admin@gelani.com --range today
```

### Email Alerts for Critical Events

Create `/usr/local/bin/alert-admin.sh`:

```bash
#!/bin/bash

ADMIN_EMAIL="admin@gelani.com"
HOSTNAME=$(hostname)

# Function to send alert
send_alert() {
    local SUBJECT=$1
    local MESSAGE=$2
    
    echo "$MESSAGE" | mail -s "[$HOSTNAME] $SUBJECT" $ADMIN_EMAIL
}

# Monitor disk space
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ $DISK_USAGE -gt 80 ]; then
    send_alert "High Disk Usage" "Disk usage is at ${DISK_USAGE}%"
fi

# Monitor load average
LOAD=$(uptime | awk -F'load average:' '{print $2}' | awk '{print $1}' | sed 's/,//')
if (( $(echo "$LOAD > 2.0" | bc -l) )); then
    send_alert "High Load Average" "Load average is $LOAD"
fi

# Monitor failed services
FAILED=$(systemctl list-units --failed --no-pager | grep -c "failed")
if [ $FAILED -gt 0 ]; then
    SERVICES=$(systemctl list-units --failed --no-pager)
    send_alert "Failed Services Detected" "$SERVICES"
fi
```

Make executable and schedule:

```bash
sudo chmod +x /usr/local/bin/alert-admin.sh

# Run every 15 minutes
sudo crontab -e
# Add: */15 * * * * /usr/local/bin/alert-admin.sh
```

### Service Monitoring Script

Create `/usr/local/bin/check-services.sh`:

```bash
#!/bin/bash

SERVICES=("bind9" "nginx" "postfix" "dovecot" "mariadb" "php8.1-fpm" "fail2ban")
ADMIN_EMAIL="admin@gelani.com"
HOSTNAME=$(hostname)

for SERVICE in "${SERVICES[@]}"; do
    if ! systemctl is-active --quiet $SERVICE; then
        echo "Service $SERVICE is not running on $HOSTNAME" | \
            mail -s "[$HOSTNAME] Service Alert: $SERVICE Down" $ADMIN_EMAIL
        
        # Attempt to restart the service
        systemctl restart $SERVICE
        
        if systemctl is-active --quiet $SERVICE; then
            echo "Service $SERVICE successfully restarted on $HOSTNAME" | \
                mail -s "[$HOSTNAME] Service $SERVICE Restarted" $ADMIN_EMAIL
        fi
    fi
done
```

Make executable and schedule:

```bash
sudo chmod +x /usr/local/bin/check-services.sh

# Run every 5 minutes
sudo crontab -e
# Add: */5 * * * * /usr/local/bin/check-services.sh
```

---

## Ongoing Maintenance

### Daily Tasks

- [ ] Check system logs for errors
- [ ] Monitor service status
- [ ] Review Fail2Ban logs
- [ ] Check mail queue

### Weekly Tasks

- [ ] Review security alerts
- [ ] Check disk space usage
- [ ] Review backup logs
- [ ] Test backup restoration
- [ ] Update fail2ban rules if needed
- [ ] Review email authentication reports

### Monthly Tasks

- [ ] Apply system updates (after testing)
- [ ] Review user accounts (remove inactive)
- [ ] Audit firewall rules
- [ ] Check SSL certificate expiry
- [ ] Review and rotate logs
- [ ] Performance optimization review
- [ ] Security audit

### Quarterly Tasks

- [ ] Full security assessment
- [ ] Disaster recovery drill
- [ ] Review and update documentation
- [ ] Password rotation
- [ ] Review third-party dependencies
- [ ] Capacity planning review

### Update Procedures

```bash
# Before updating
sudo apt update
sudo apt list --upgradable

# Create snapshot/backup
sudo /usr/local/bin/backup-mail-server.sh

# Update packages
sudo apt upgrade -y

# Reboot if kernel updated
sudo reboot

# After reboot, verify services
sudo systemctl status bind9 nginx postfix dovecot mariadb php8.1-fpm
```

---

## Security Checklist

### Pre-Production Deployment

- [ ] **SSL/TLS Certificates**
  - [ ] Certificates obtained and installed
  - [ ] HTTPS redirect configured
  - [ ] HSTS headers enabled
  - [ ] Certificate auto-renewal tested

- [ ] **Web Server (Nginx)**
  - [ ] HTTPS only (HTTP redirects to HTTPS)
  - [ ] Security headers configured
  - [ ] Rate limiting enabled
  - [ ] Hidden files/directories protected
  - [ ] SSL configuration hardened

- [ ] **Mail Server**
  - [ ] SMTPS/Submission (port 587/465) configured
  - [ ] IMAPS (port 993) configured
  - [ ] Plain text authentication disabled over non-SSL
  - [ ] SASL authentication enabled
  - [ ] Postfix restrictions configured

- [ ] **Email Authentication**
  - [ ] SPF record published
  - [ ] DKIM signing enabled
  - [ ] DMARC policy published
  - [ ] Test emails passing authentication

- [ ] **DNS Server**
  - [ ] Recursion limited to trusted networks
  - [ ] Zone transfers restricted
  - [ ] DNSSEC enabled (if applicable)
  - [ ] Rate limiting configured
  - [ ] Version information hidden

- [ ] **Firewall (UFW)**
  - [ ] Default deny incoming
  - [ ] Only necessary ports open
  - [ ] Rate limiting enabled
  - [ ] Rules tested and verified

- [ ] **Intrusion Prevention (Fail2Ban)**
  - [ ] Installed and running
  - [ ] All critical services protected
  - [ ] Email notifications configured
  - [ ] Ban/unban procedures documented

- [ ] **System Hardening**
  - [ ] SSH hardened (key-only, no root)
  - [ ] Strong password policy enforced
  - [ ] Automatic security updates enabled
  - [ ] Unnecessary services disabled
  - [ ] Kernel parameters hardened

- [ ] **Backup System**
  - [ ] Automated backups scheduled
  - [ ] Backup script tested
  - [ ] Remote backup configured
  - [ ] Restore procedures tested
  - [ ] Retention policy implemented

- [ ] **Monitoring & Alerting**
  - [ ] Service monitoring configured
  - [ ] Log monitoring enabled
  - [ ] Email alerts configured
  - [ ] Disk space monitoring active
  - [ ] Performance monitoring enabled

### Post-Deployment Verification

- [ ] **Functionality Tests**
  - [ ] DNS resolution working
  - [ ] Website accessible via HTTPS
  - [ ] Webmail accessible via HTTPS
  - [ ] Can send email (SMTP)
  - [ ] Can receive email (SMTP)
  - [ ] Can read email (IMAP)
  - [ ] SSL certificates valid

- [ ] **Security Tests**
  - [ ] SSL/TLS configuration scored (SSL Labs)
  - [ ] Email authentication passing (mail-tester.com)
  - [ ] Firewall rules working
  - [ ] Fail2Ban blocking attacks
  - [ ] No exposed insecure ports
  - [ ] Security headers present

- [ ] **Monitoring Tests**
  - [ ] Alerts being received
  - [ ] Logs being generated
  - [ ] Backups completing successfully
  - [ ] Service monitoring working
  - [ ] Remote backup syncing

### Ongoing Security Maintenance

- [ ] **Daily**
  - [ ] Review critical alerts
  - [ ] Check service status
  - [ ] Monitor Fail2Ban activity

- [ ] **Weekly**
  - [ ] Review all security logs
  - [ ] Check backup completion
  - [ ] Test backup restoration
  - [ ] Review email authentication reports

- [ ] **Monthly**
  - [ ] Apply security updates
  - [ ] Audit user accounts
  - [ ] Review firewall rules
  - [ ] Check certificate expiry
  - [ ] Security scan

- [ ] **Quarterly**
  - [ ] Full security audit
  - [ ] Disaster recovery drill
  - [ ] Update documentation
  - [ ] Review incident response plan

---

## Conclusion

This guide provides comprehensive security hardening for DNS, Web, and Mail server infrastructure. Implementing these measures transforms the test environment into a production-ready, secure deployment.

**⚠️ REMEMBER:** Security is not a one-time task, it's an ongoing process. Stay vigilant, stay updated, stay secure.

---
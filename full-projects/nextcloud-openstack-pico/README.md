# Nextcloud with MinIO Object Storage on Ubuntu 22.04

A complete deployment guide for Nextcloud with MinIO as object storage backend, using Nginx and MariaDB. This documentation reflects the actual installation process including troubleshooting steps.

## 📋 Table of Contents

- [Overview](#overview)
- [Environment Details](#environment-details)
- [Installation Steps](#installation-steps)
  - [1. System Update](#1-system-update)
  - [2. Storage Configuration](#2-storage-configuration)
  - [3. Network Configuration](#3-network-configuration)
  - [4. Download and Extract Nextcloud](#4-download-and-extract-nextcloud)
  - [5. Install and Configure MinIO](#5-install-and-configure-minio)
  - [6. Configure MariaDB](#6-configure-mariadb)
  - [7. Configure Nginx](#7-configure-nginx)
  - [8. Set Permissions](#8-set-permissions)
- [Troubleshooting Journey](#troubleshooting-journey)
- [Final Working Configuration](#final-working-configuration)

## Overview

| Component | Version |
|-----------|---------|
| Ubuntu | 22.04.5 LTS |
| Kernel | 5.15.0-164-generic |
| Nextcloud | Latest |
| MinIO | Latest |
| Nginx | 1.18.0 |
| MariaDB | 10.6.22 |
| PHP | 8.1 |

## Environment Details

- **Server IP**: 160.191.150.238 (Public) / 192.168.90.28 (Private)
- **Data Disk**: /dev/vdb (100GB)
- **Nextcloud Data**: /mnt/nextcloud-data
- **MinIO Data**: /mnt/minio-data

---

## Installation Steps

### 1. System Update

```bash
sudo apt update && sudo apt upgrade -y
```

After upgrade, reboot the system:
```bash
sudo reboot
```

### 2. Storage Configuration

Check available disks:
```bash
lsblk
```

Output showed:
```
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
vda     252:0    0   30G  0 disk
├─vda1  252:1    0 29.9G  0 part /
├─vda14 252:14   0    4M  0 part
└─vda15 252:15   0  106M  0 part /boot/efi
vdb     252:16   0  100G  0 disk
```

Create partition on /dev/vdb:
```bash
sudo fdisk /dev/vdb
```

Inside fdisk:
```
Command (m for help): n
Partition type: p (primary)
Partition number: 1
First sector: (default)
Last sector: (default)
Command (m for help): w
```

Format the partition:
```bash
sudo mkfs.ext4 /dev/vdb1
```

Create mount point and mount:
```bash
sudo mkdir /mnt/nextcloud-data
sudo mount /dev/vdb1 /mnt/nextcloud-data
```

Get the UUID:
```bash
sudo blkid /dev/vdb1
```

Output:
```
/dev/vdb1: UUID="09cf77bd-64f2-4007-b55b-03a91e63f237" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="5fb1d1fb-01"
```

Add to /etc/fstab for persistent mount:
```bash
sudo nano /etc/fstab
```

Add this line:
```
UUID="09cf77bd-64f2-4007-b55b-03a91e63f237" /mnt/nextcloud-data ext4 defaults,nofail 0 2
```

Test and verify:
```bash
sudo umount /mnt/nextcloud-data
sudo mount -a
df -h
```

Verify output shows:
```
/dev/vdb1        98G   24K   93G   1% /mnt/nextcloud-data
```

### 3. Network Configuration

Disable cloud-init network configuration:
```bash
sudo nano /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
```

Add:
```yaml
network: {config: disabled}
```

Create static IP configuration:
```bash
sudo nano /etc/netplan/01-netcfg.yaml
```

Add:
```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      addresses: [192.168.90.28/27]
      routes:
        - to: default
          via: 192.168.90.1
      nameservers:
        addresses: [127.0.0.1, 8.8.8.8]
      match:
        macaddress: fa:16:3e:8b:65:64
      mtu: 8942
```

Set permissions and apply:
```bash
sudo chmod 600 /etc/netplan/01-netcfg.yaml
sudo rm /etc/netplan/50-cloud-init.yaml
sudo systemctl disable systemd-networkd-wait-online
sudo netplan apply
```

Test connectivity:
```bash
ping -c 3 8.8.8.8
```

### 4. Download and Extract Nextcloud

```bash
cd /var/www
sudo wget https://download.nextcloud.com/server/releases/latest.zip
sudo unzip latest.zip
```

Set ownership:
```bash
sudo chown -R www-data:www-data /var/www/nextcloud
sudo chown -R www-data:www-data /mnt/nextcloud-data
```

### 5. Install and Configure MinIO

Download MinIO:
```bash
cd /usr/local/bin
sudo wget https://dl.min.io/server/minio/release/linux-amd64/minio
sudo chmod +x minio
```

Create MinIO user:
```bash
sudo useradd -r minio -s /sbin/nologin
sudo mkdir /etc/minio
```

Create MinIO configuration:
```bash
sudo nano /etc/minio/minio.conf
```

Add:
```bash
MINIO_ROOT_USER=minioadmin
MINIO_ROOT_PASSWORD=STRONG_MINIO_PASSWORD
MINIO_VOLUMES="/mnt/minio-data"
MINIO_OPTS="--console-address :9001"
```

Set ownership:
```bash
sudo chown -R minio:minio /mnt/minio-data
```

Create systemd service:
```bash
sudo nano /etc/systemd/system/minio.service
```

Add:
```ini
[Unit]
Description=MinIO
After=network-online.target

[Service]
User=minio
Group=minio
EnvironmentFile=/etc/minio/minio.conf
ExecStart=/usr/local/bin/minio server $MINIO_OPTS $MINIO_VOLUMES
Restart=always
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
```

Enable and start MinIO:
```bash
sudo systemctl daemon-reexec
sudo systemctl enable minio
sudo systemctl start minio
```

### 6. Configure MariaDB

> **Note**: PHP, Nginx, and MariaDB were pre-installed. The log shows working with existing installations.

Check MariaDB status:
```bash
systemctl status mysql
```

Output confirmed:
```
● mariadb.service - MariaDB 10.6.22 database server
     Active: active (running)
```

#### Initial Database Error

When accessing Nextcloud GUI, encountered error:
```
Error while trying to create admin account: An exception occurred in the driver: 
SQLSTATE[HY000] [1045] Access denied for user 'nextcloud'@'localhost' (using password: YES)
```

#### Fix: Recreate Database User

```bash
sudo mysql
```

Check existing users:
```sql
SELECT user, host FROM mysql.user;
```

Output:
```
+-------------+-----------+
| User        | Host      |
+-------------+-----------+
| mariadb.sys | localhost |
| mysql       | localhost |
| nextcloud   | localhost |
| root        | localhost |
+-------------+-----------+
```

Drop and recreate the user with correct authentication:
```sql
DROP USER IF EXISTS 'nextcloud'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'nextcloud'@'localhost'
IDENTIFIED VIA mysql_native_password
USING PASSWORD('Nc12345!');

GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud'@'localhost';
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'nextcloud'@'localhost';
```

Output:
```
+------------------------------------------------------------------------------------------------------------------+
| Grants for nextcloud@localhost                                                                                   |
+------------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `nextcloud`@`localhost` IDENTIFIED BY PASSWORD '*64EC5F650633D04A3D778C98317570EBEEF5AE3C' |
| GRANT ALL PRIVILEGES ON `nextcloud`.* TO `nextcloud`@`localhost`                                                 |
+------------------------------------------------------------------------------------------------------------------+
```

Test connection:
```bash
mysql -u nextcloud -p -h localhost nextcloud
```

### 7. Configure Nginx

#### Initial Configuration (Had Issues)

First attempt at `/etc/nginx/sites-available/nextcloud`:
```nginx
server {
    listen 80;
    server_name 160.191.150.238;

    root /var/www/nextcloud;
    index index.php index.html;

    client_max_body_size 10G;

    location / {
        try_files $uri $uri/ /index.php$request_uri;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.1-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}
```

Enable site:
```bash
sudo ln -s /etc/nginx/sites-available/nextcloud /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```

#### Troubleshooting: 500 Internal Server Error

Checked error logs:
```bash
sudo tail -n 50 /var/log/nginx/error.log
```

Found error:
```
rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/login"
```

#### Multiple Configuration Attempts

Created new configuration file:
```bash
sudo nano /etc/nginx/sites-available/nextcloud.conf
```

Attempt 1 - Using upstream php-handler:
```nginx
upstream php-handler {
    server unix:/run/php/php8.1-fpm.sock;
}

server {
    listen 80;
    server_name  _;

    root /var/www/nextcloud/;

    client_max_body_size 10240M;
    fastcgi_buffers 64 4K;

    index index.php index.html /index.php$request_uri;

    location / {
        rewrite ^ /index.php$request_uri;
    }

    location ~ ^/(?:build|tests|config|lib|3rdparty|templates|data)/ {
        deny all;
    }

    location ~ ^/(?:\.|autotest|occ|issue|indie|db_|console) {
        deny all;
    }

    location ~ \.php(?:$|/) {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
        fastcgi_param HTTPS off;
        fastcgi_pass php-handler;
        fastcgi_intercept_errors on;
    }

    location ~* \.(?:css|js|woff|svg|gif)$ {
        try_files $uri /index.php$request_uri;
        access_log off;
        expires 6M;
    }

    location ~* \.(?:png|html|ttf|ico|jpg|jpeg)$ {
        try_files $uri /index.php$request_uri;
        access_log off;
        expires 6M;
    }
}
```

**Issue**: Still getting redirection cycle errors and conflicting server name warnings.

Clean up duplicate configs:
```bash
sudo rm /etc/nginx/sites-enabled/nextcloud.conf
ls /etc/nginx/sites-enabled/
```

Output: `nextcloud`

### 8. Set Permissions

```bash
sudo chown -R www-data:www-data /var/www/nextcloud
sudo find /var/www/nextcloud -type d -exec chmod 750 {} \;
sudo find /var/www/nextcloud -type f -exec chmod 640 {} \;

sudo chown -R www-data:www-data /mnt/nextcloud-data
sudo chmod -R 750 /mnt/nextcloud-data
```

Also tried:
```bash
sudo find /var/www/nextcloud -type d -exec chmod 755 {} \;
sudo find /var/www/nextcloud -type f -exec chmod 644 {} \;
```

---

## Final Working Configuration

After troubleshooting, the final working Nginx configuration at `/etc/nginx/sites-available/nextcloud`:

```nginx
server {
    listen 80;
    server_name 160.191.150.238;

    root /var/www/nextcloud;
    index index.php index.html /index.php$request_uri;

    client_max_body_size 10G;
    fastcgi_buffers 64 4K;

    add_header Referrer-Policy "no-referrer" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-XSS-Protection "1; mode=block" always;

    location = /robots.txt {
        allow all;
        log_not_found off;
        access_log off;
    }

    location = /.well-known/carddav {
        return 301 $scheme://$host/remote.php/dav;
    }

    location = /.well-known/caldav {
        return 301 $scheme://$host/remote.php/dav;
    }

    location ~ ^/(?:build|tests|config|lib|3rdparty|templates|data)/ {
        deny all;
    }

    location ~ ^/(?:\.|autotest|occ|issue|indie|db_|console) {
        deny all;
    }

    location / {
        rewrite ^ /index.php$request_uri;
    }

    location ~ \.php(?:$|/) {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.1-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ \.(?:css|js|svg|gif|png|jpg|ico|woff2?)$ {
        try_files $uri /index.php$request_uri;
        access_log off;
        expires 6M;
    }
}
```

Test and restart:
```bash
sudo nginx -t
sudo systemctl reload nginx
sudo systemctl restart php8.1-fpm
```

---

## Troubleshooting Journey

### Issue 1: Database Access Denied
**Error**: `SQLSTATE[HY000] [1045] Access denied for user 'nextcloud'@'localhost'`

**Cause**: Password mismatch or authentication plugin issue

**Fix**: Dropped and recreated user with `mysql_native_password` authentication

### Issue 2: 500 Internal Server Error
**Error in logs**: `rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/login"`

**Cause**: Nginx rewrite rules causing infinite loop

**Fix**: Corrected the location blocks and rewrite rules

### Issue 3: Conflicting Server Names
**Warning**: `conflicting server name "160.191.150.238" on 0.0.0.0:80, ignored`

**Cause**: Multiple config files in sites-enabled with same server_name

**Fix**: Removed duplicate config files
```bash
sudo rm /etc/nginx/sites-enabled/nextcloud.conf
# Keep only: /etc/nginx/sites-enabled/nextcloud
```

### Useful Debug Commands

```bash
# Check Nginx errors
sudo tail -n 50 /var/log/nginx/error.log

# Check PHP-FPM status
sudo systemctl status php8.1-fpm

# Check PHP-FPM socket
ls -l /run/php/

# Check Nextcloud logs
sudo tail -n 50 /var/www/nextcloud/data/nextcloud.log

# Check MariaDB status
systemctl status mysql

# Test Nginx configuration
sudo nginx -t

# Check sites enabled
ls /etc/nginx/sites-enabled/
```

---

## Service Access

| Service | URL | Port |
|---------|-----|------|
| Nextcloud | http://160.191.150.238/ | 80 |
| MinIO API | http://160.191.150.238:9000 | 9000 |
| MinIO Console | http://160.191.150.238:9001 | 9001 |

---

## Notes

- PHP 8.1, Nginx, and MariaDB were pre-installed on the system
- The installation was done over multiple sessions (Dec 15-17, 2025)
- Some Nginx configuration issues required multiple iterations to resolve
- The `mysql_native_password` authentication method was required for Nextcloud to connect to MariaDB

---

## Author

Kazi Emaduzzaman

## Date

December 2025

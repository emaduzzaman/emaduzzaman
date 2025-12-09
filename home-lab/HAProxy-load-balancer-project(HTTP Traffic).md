# HAProxy Load Balancer on Proxmox VE
---

## Overview

This project implements a simple yet effective HTTP load balancer using **HAProxy** to distribute incoming traffic across two Nginx web servers in a round-robin fashion. The entire infrastructure runs on Proxmox VE installed on repurposed laptop hardware.

### Objectives

- Demonstrate load balancing concepts in a practical environment
- Configure HAProxy for HTTP traffic distribution
- Set up backend web servers with unique identifiers
- Validate load balancing behavior through testing

---

## Architecture

### Network Topology

```
                               Local Network
                                    │
                                    │
                                    ▼
                        ┌───────────────────────┐
                        │    Client Machine     │
                        │   (MacBook/Browser)   │
                        └───────────┬───────────┘
                                    │
                                    │ HTTP Request (Port 80)
                                    │
                                    ▼
                        ┌───────────────────────────┐
                        │   HAProxy Load Balancer   │
                        │   IP: 192.168.10.244      │
                        │   Port: 80                │
                        │   Algorithm: RoundRobin   │
                        └───────────┬───────────────┘
                                    │
                    ┌───────────────┴────────────────┐
                    │                                │
                    ▼                                ▼
        ┌───────────────────────┐      ┌───────────────────────┐
        │   Backend Server 1    │      │   Backend Server 2    │
        │   vm-1                │      │   vm-2                │
        │   IP: 192.168.10.150  │      │   IP: 192.168.10.138  │
        │   Nginx Web Server    │      │   Nginx Web Server    │
        │   Response: "VM-1"    │      │   Response: "VM-2"    │
        └───────────────────────┘      └───────────────────────┘
```

### Component Details

| Component | IP Address | Role | Software |
|-----------|------------|------|----------|
| Load Balancer | 192.168.10.244 | Traffic distribution | HAProxy |
| Backend VM-1 | 192.168.10.150 | Web server | Nginx |
| Backend VM-2 | 192.168.10.138 | Web server | Nginx |

### Traffic Flow

1. **Client Request**: User sends HTTP request to `192.168.10.244`
2. **Load Balancer**: HAProxy receives request on port 80
3. **Backend Selection**: Round-robin algorithm selects next available server
4. **Health Check**: HAProxy verifies backend server is healthy
5. **Request Forward**: Traffic forwarded to selected backend
6. **Response**: Backend server responds, HAProxy forwards to client

---

## Infrastructure Setup

### Step 1: Create Virtual Machines in Proxmox

Create three Ubuntu Server VMs with the following specifications:

**VM Configuration:**
```
CPU: 1-2 cores
RAM: 1-2 GB
Disk: 10-20 GB
Network: Bridge to local network
```

**IP Assignment:**
- Load Balancer: 192.168.10.244
- VM-1: 192.168.10.150
- VM-2: 192.168.10.138

### Step 2: Configure Backend Web Servers

#### On VM-1 (192.168.10.150)

```bash
# Update system packages
sudo apt update && sudo apt upgrade -y

# Install Nginx web server
sudo apt install nginx -y

# Create custom index page
echo "This is VM-1" | sudo tee /var/www/html/index.html

# Verify Nginx is running
sudo systemctl status nginx
```

#### On VM-2 (192.168.10.138)

```bash
# Update system packages
sudo apt update && sudo apt upgrade -y

# Install Nginx web server
sudo apt install nginx -y

# Create custom index page
echo "This is VM-2" | sudo tee /var/www/html/index.html

# Verify Nginx is running
sudo systemctl status nginx
```

#### Verify Backend Servers

```bash
# Test VM-1
curl http://192.168.10.150
# Expected output: This is VM-1

# Test VM-2
curl http://192.168.10.138
# Expected output: This is VM-2
```

---

## Configuration

### Step 3: Install HAProxy on Load Balancer

```bash
# SSH into load balancer VM
ssh user@192.168.10.244

# Update system packages
sudo apt update && sudo apt upgrade -y

# Install HAProxy
sudo apt install haproxy -y

# Verify installation
haproxy -v
```

### Step 4: Configure HAProxy

Edit the HAProxy configuration file:

```bash
sudo nano /etc/haproxy/haproxy.cfg
```

Replace the contents with the following configuration:

```haproxy
# Global settings
global
    log /dev/log local0
    log /dev/log local1 notice
    chroot /var/lib/haproxy
    stats socket /run/haproxy/admin.sock mode 660 level admin
    stats timeout 30s
    user haproxy
    group haproxy
    daemon

# Default settings
defaults
    log     global
    mode    http
    option  httplog
    option  dontlognull
    timeout connect 5000ms
    timeout client  50000ms
    timeout server  50000ms
    errorfile 400 /etc/haproxy/errors/400.http
    errorfile 403 /etc/haproxy/errors/403.http
    errorfile 408 /etc/haproxy/errors/408.http
    errorfile 500 /etc/haproxy/errors/500.http
    errorfile 502 /etc/haproxy/errors/502.http
    errorfile 503 /etc/haproxy/errors/503.http
    errorfile 504 /etc/haproxy/errors/504.http

# Frontend configuration
frontend http_front
    bind *:80
    stats uri /haproxy?stats
    default_backend http_back

# Backend configuration
backend http_back
    balance roundrobin
    option httpchk GET /
    server vm1 192.168.10.150:80 check
    server vm2 192.168.10.138:80 check
```

### Configuration Breakdown

**Global Section:**
- Defines system-level settings
- Sets up logging to syslog
- Runs HAProxy as daemon with dedicated user

**Defaults Section:**
- Sets HTTP mode for all proxies
- Configures connection timeouts
- Enables HTTP logging

**Frontend Section:**
- `bind *:80` - Listens on all interfaces, port 80
- `stats uri /haproxy?stats` - Optional stats page
- Routes all traffic to backend

**Backend Section:**
- `balance roundrobin` - Distribution algorithm
- `option httpchk GET /` - Health check via HTTP GET
- Defines two backend servers with health monitoring

### Step 5: Apply Configuration

```bash
# Test configuration syntax
sudo haproxy -c -f /etc/haproxy/haproxy.cfg

# Restart HAProxy service
sudo systemctl restart haproxy

# Enable HAProxy to start on boot
sudo systemctl enable haproxy

# Check service status
sudo systemctl status haproxy
```

---

## Testing

### Basic Load Balancing Test

Run multiple curl requests to observe round-robin behavior:

```bash
# From your local machine
for i in {1..10}; do
  echo "Request $i:"
  curl http://192.168.10.244
  echo ""
done
```

**Expected Output:**
```
Request 1:
This is VM-1

Request 2:
This is VM-2

Request 3:
This is VM-1

Request 4:
This is VM-2
...
```

### Browser Testing

1. Open browser and navigate to: `http://192.168.10.244`
2. Refresh multiple times
3. Observe alternating responses between VM-1 and VM-2

### Health Check Verification

```bash
# View HAProxy logs
sudo tail -f /var/log/haproxy.log

# Check backend server status
echo "show stat" | sudo socat stdio /run/haproxy/admin.sock
```

### Simulate Server Failure

```bash
# Stop Nginx on VM-1
ssh user@192.168.10.150
sudo systemctl stop nginx

# Test load balancer (should only show VM-2)
curl http://192.168.10.244

# Restart Nginx
sudo systemctl start nginx
```

### Performance Testing (Optional)

Using Apache Bench:

```bash
# Install Apache Bench
sudo apt install apache2-utils -y

# Run load test
ab -n 1000 -c 10 http://192.168.10.244/
```

---

## 🔧 Troubleshooting

### Common Issues and Solutions

#### Issue 1: Cannot Connect to Load Balancer

**Symptoms:**
- `curl: (7) Failed to connect to 192.168.10.244 port 80`

**Solution:**
```bash
# Check if HAProxy is running
sudo systemctl status haproxy

# Check if port 80 is listening
sudo netstat -tlnp | grep :80

# Restart HAProxy
sudo systemctl restart haproxy
```

#### Issue 2: SSH Access Lost After Setup

**Symptoms:**
- Cannot SSH into VMs after initial configuration

**Solution:**
```bash
# Access VM through Proxmox console
# Install and enable SSH server
sudo apt install openssh-server -y
sudo systemctl start ssh
sudo systemctl enable ssh

# Verify SSH is running
sudo systemctl status ssh
```

#### Issue 3: Load Balancer Shows Only One Server

**Symptoms:**
- All requests go to same backend server

**Solution:**
```bash
# Check backend health
echo "show stat" | sudo socat stdio /run/haproxy/admin.sock | grep http_back

# Verify both Nginx servers are running
ssh user@192.168.10.150 'sudo systemctl status nginx'
ssh user@192.168.10.138 'sudo systemctl status nginx'

# Check HAProxy logs for errors
sudo journalctl -u haproxy -f
```

#### Issue 4: 503 Service Unavailable

**Symptoms:**
- HAProxy returns 503 error

**Solution:**
```bash
# Verify backend servers are accessible from load balancer
curl http://192.168.10.150
curl http://192.168.10.138

# Check HAProxy configuration
sudo haproxy -c -f /etc/haproxy/haproxy.cfg

# Review error logs
sudo tail -f /var/log/haproxy.log
```

### Useful Commands

```bash
# View real-time HAProxy stats
watch -n 1 'echo "show stat" | sudo socat stdio /run/haproxy/admin.sock'

# Monitor HAProxy logs
sudo tail -f /var/log/haproxy.log

# Check network connectivity
ping 192.168.10.150
ping 192.168.10.138

# Restart all services
sudo systemctl restart haproxy nginx
```

---

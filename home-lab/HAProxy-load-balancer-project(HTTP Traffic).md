# HAProxy Load Balancer Project (HTTP Traffic)

### 🔧 Setup on Old Laptop using Proxmox

---

## ✅ **Objective**

> Set up a Load Balancer at 192.168.10.244 that distributes HTTP traffic between two backend servers:
> 
- **vm-1**: 192.168.10.150
- **vm-2**: 192.168.10.138

---

## 🖥️ **Infrastructure Diagram (Text-Based)**

```
                    ┌───────────────────────────┐
                    │   Client / Browser        │
                    │  (curl / browser test)    │
                    └────────────┬──────────────┘
                                 │ HTTP Request
                                 ▼
                       ┌───────────────────┐
                       │ Load Balancer VM  │
                       │ IP: 192.168.10.244│
                       │  HAProxy (port 80)│
                       └─────────┬─────────┘
                  ┌──────────────┴──────────────┐
                  ▼                             ▼
         ┌───────────────────┐         ┌─────────────────────┐
         │    vm-1           │         │    vm-2             │
         │ IP: 192.168.10.150│         │  IP: 192.168.10.138 │
         │  Nginx Web Server │         │  Nginx Web Server   │
         └───────────────────┘         └─────────────────────┘

```

---

## 🪛 Step-by-Step Implementation

### 🧩 **Step 1: Backend Web Servers Setup**

**On `vm-1`:**

```bash
sudo apt update
sudo apt install nginx -y
echo "This is VM-1" | sudo tee /var/www/html/index.html

```

**On `vm-2`:**

```bash
sudo apt update
sudo apt install nginx -y
echo "This is VM-2" | sudo tee /var/www/html/index.html

```

✅ **Verify:**

```bash
curl http://192.168.10.150  # Output: This is VM-1
curl http://192.168.10.138  # Output: This is VM-2

```

---

### 💡 **TIP: Identify Terminals Easily**

You set custom shell prompts for better clarity:

```bash
export PS1="vm-1> "
export PS1="vm-2> "
export PS1="load-balancer> "

```

🧠 *This helps you avoid confusion while working with multiple terminals.*

---

### 🧩 **Step 2: Install HAProxy on Load Balancer VM**

```bash
ssh user@192.168.10.244
sudo apt update
sudo apt install haproxy -y

```

---

### 🧩 **Step 3: Configure HAProxy**

```bash
sudo nano /etc/haproxy/haproxy.cfg

```

📜 **Replace contents with:**

```
global
    log /dev/log local0
    log /dev/log local1 notice
    daemon

defaults
    log     global
    mode    http
    option  httplog
    timeout connect 5000
    timeout client  50000
    timeout server  50000

frontend http_front
    bind *:80
    default_backend http_back

backend http_back
    balance roundrobin
    server vm1 192.168.10.150:80 check
    server vm2 192.168.10.138:80 check

```

---

### 🔁 **Step 4: Restart & Enable HAProxy**

```bash
sudo systemctl restart haproxy
sudo systemctl enable haproxy

```

✅ **Test the Load Balancer**

```bash
curl http://192.168.10.244
# It will alternate between:
# This is VM-1
# This is VM-2

```

---

## ⚠️ SSH Issue & Fix

After setup, SSH access was lost on VMs. To fix:

```bash
sudo apt install openssh-server -y
sudo systemctl start ssh
sudo systemctl enable ssh

```

Repeat on:

- vm-1
- vm-2
- load balancer

✅ After that, you re-established SSH access from your **MacBook Terminal**.

---

## 🧠 Summary

- ✅ Built 3 VMs in Proxmox (1 Load Balancer + 2 Web Servers)
- ✅ Installed Nginx on both web VMs with unique HTML messages
- ✅ Installed and configured HAProxy to forward HTTP traffic using **roundrobin**
- ✅ Validated via `curl` that traffic alternates between VM-1 and VM-2
- ✅ Resolved SSH access issue on all VMs

---

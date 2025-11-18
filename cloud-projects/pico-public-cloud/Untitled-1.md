Here you go, Supto — a clean, nicely formatted **Markdown (.md)** version ready to upload to GitHub.
I kept everything clear, professional, and structured.
I also added a **placeholder section for your screenshot** showing different responses from vm-1 and vm-2.
I used a *valid example private IP range* (consistent with your setup: 192.168.10.x).

You can copy–paste this directly into a `README.md` file.

---

# 🚀 Load Balancing on Pico Public Cloud (AmphoraV2)

### Step-by-Step Setup of Layer 4 & Layer 7 Load Balancing Using the Default Pico Cloud Load Balancer

This project demonstrates how I deployed two Ubuntu VMs on **Pico Public Cloud**, configured them with **nginx**, and then used the default **AmphoraV2 Load Balancer** to distribute both SSH and HTTP traffic between them.

The load balancer uses a **Floating IP** to expose services externally, and the backend VMs respond alternately using **Round Robin**.
A screenshot is included below showing how the **same IP displays different HTML responses** like *"Welcome from vm-1"* and *"Welcome from vm-2"*.

---

## 📸 Screenshot: HTTP Load Balancing Result

> *(Insert your screenshot here showing the two different pages)*

```
![Load Balancing Demo Screenshot](PATH_TO_YOUR_IMAGE)
```

---

# 📘 Architecture Overview

```
                      ┌────────────────────────────┐
                      │      External Internet     │
                      └────────────┬───────────────┘
                                   │
                                   ▼
                     ┌────────────────────────────┐
                     │   Floating IP (Elastic IP) │
                     │        160.191.150.136     │
                     └────────────┬───────────────┘
                                  │
                                  ▼
                     ┌────────────────────────────┐
                     │ Load Balancer: AmphoraV2   │
                     │ Name: load-balancer-test   │
                     │ Subnet: net-1              │
                     └────────────┬───────────────┘
                                  │
              ┌───────────────────┼───────────────────┐
              │                                       │
    ┌─────────▼────────┐                  ┌───────────▼─────────┐
    │ Listener: lis-ssh│                  │ Listener: lis-http  │
    │ Protocol: TCP/22 │                  │ Protocol: HTTP/80   │
    └─────────┬────────┘                  └───────────┬─────────┘
              │                                       │
    ┌─────────▼────────┐                  ┌───────────▼─────────┐
    │ Pool: pool-ssh   │                  │ Pool: pool-http     │
    │ Algorithm: RR    │                  │ Algorithm: RR       │
    └─────────┬────────┘                  └───────────┬─────────┘
              │                                       │
  ┌───────────▼────────────┐              ┌───────────▼────────────┐
  │ Member: vm-1           │              │ Member: vm-1           │
  │ IP: 192.168.10.101     │              │ IP: 192.168.10.101     │
  └───────────┬────────────┘              └───────────┬────────────┘
              │                                       │
  ┌───────────▼────────────┐              ┌───────────▼────────────┐
  │ Member: vm-2           │              │ Member: vm-2           │
  │ IP: 192.168.10.102     │              │ IP: 192.168.10.102     │
  └────────────────────────┘              └────────────────────────┘
```

---

# 📝 Step-By-Step Configuration

## 1️⃣ Login & Accessing Compute

* Logged into Pico Cloud
* Navigated to **Compute → Instances**
* Goal: Deploy two VMs for testing (HTTP + SSH)

---

## 2️⃣ Network Configuration

**Network Name:** `net-1`
**Subnet:** `192.168.10.0/24`
**Gateway:** Enabled (→ `192.168.10.1`)
**DNS:** `8.8.8.8`
**DHCP Pool:** `192.168.10.2 - 192.168.10.254`

📌 *Purpose: Provide internal communication between VMs.*

---

## 3️⃣ Router Configuration

**Router Name:** `router`
**SNAT:** Enabled
**External Network:** `public-fir-pool-01`

Internal interface added → `192.168.10.1`

📌 *Enables outbound internet access from VMs using SNAT.*

---

## 4️⃣ VM Creation

Created two Ubuntu VMs:

| VM   | OS           | Private IP     | Purpose       |
| ---- | ------------ | -------------- | ------------- |
| vm-1 | Ubuntu 18.04 | 192.168.10.101 | nginx backend |
| vm-2 | Ubuntu 18.04 | 192.168.10.102 | nginx backend |

**Security Group: `sec-1`**

* Allowed:

  * TCP 22 (SSH)
  * TCP 80 (HTTP)
  * TCP 443 (HTTPS)
  * ICMP (Ping)

---

## Floating IP Allocation

Allocated Floating IP:

```
160.191.150.136
```

Attached this to the Load Balancer later.

---

##Load Balancer Setup

Created an **AmphoraV2** Load Balancer:

* Name: `load-balancer-test`
* Subnet: `net-1`
* Admin State: Enabled

---

##Listener Creation

Created two listeners:

| Listener | Protocol | Port |
| -------- | -------- | ---- |
| lis-ssh  | TCP      | 22   |
| lis-http | HTTP     | 80   |

Listeners act as entry points.

---

##Attach Floating IP

Attached the FIP `160.191.150.136`
→ Now reachable from the internet.

---

## 9️⃣ Pool Configuration

Two pools configured:

| Pool      | Protocol | Algorithm   | Session Persistence |
| --------- | -------- | ----------- | ------------------- |
| pool-ssh  | TCP      | Round Robin | None                |
| pool-http | HTTP     | Round Robin | None                |

---

##Adding Pool Members

Added vm-1 and vm-2 to both pools using:

* `192.168.10.101`
* `192.168.10.102`

This creates backend targets for the LB.

---

# Testing the Load Balancer

## ✔ SSH Test

Repeated multiple SSH attempts:

```
ssh ubuntu@160.191.150.136
```

Result:

* First login → vm-2
* Next login → vm-1
* Alternates via Round Robin

---

## ✔ HTTP Test

Installed nginx and deployed simple HTML pages:

**vm-1:**

```
Welcome from vm-1
```

**vm-2:**

```
Welcome from vm-2
```

Opened the same IP:

```
http://160.191.150.136
```

Results alternated → Verified HTTP load balancing.

---
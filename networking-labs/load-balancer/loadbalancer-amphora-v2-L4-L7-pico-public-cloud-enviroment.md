# Testing Load Balancer for L4 and L7 : AMPHORA V2

---

```
                      ┌────────────────────────────┐
                      │      External Internet     │
                      └────────────┬───────────────┘
                                   │
                                   ▼
                     ┌────────────────────────────┐
                     │   Floating IP (Elastic IP) │
                     │   160.191.150.136          │
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
  │ IP: 192.168.10.x       │              │ IP: 192.168.10.x       │
  └───────────┬────────────┘              └───────────┬────────────┘
              │                                       │
  ┌───────────▼────────────┐              ┌───────────▼────────────┐
  │ Member: vm-2           │              │ Member: vm-2           │
  │ IP: 192.168.10.x       │              │ IP: 192.168.10.x       │
  └────────────────────────┘              └────────────────────────┘
                 ▲                                   ▲
                 │                                   │
          ┌──────┴────────┐                  ┌───────┴───────┐
          │ Instance: vm-1│                  │ Instance: vm-2│
          │ OS: Ubuntu    │                  │ OS: Ubuntu    │
          │ nginx + HTML  │                  │ nginx + HTML  │
          └───────────────┘                  └───────────────┘
                 ▲                                   ▲
                 │                                   │
        ┌────────┴───────────────────────────────────┴────────┐
        │                    Network: net-1                   │
        │              Subnet: 192.168.10.0/24                │
        │              Gateway: 192.168.10.1                  │
        │              DNS: 8.8.8.8                           │
        └────────┬────────────────────────────────┬───────────┘
                 │                                │
                 ▼                                ▼
      ┌────────────────────┐          ┌────────────────────────┐
      │  Router: router    │──────────│  External Net: public- │
      │  SNAT: Enabled     │          │  fir-pool-01           │
      │  Interface IP:     │          └────────────────────────┘
      │  192.168.10.1      │
      └────────────────────┘

```

## 📘 **Step-by-Step Explanation**

### **1. Login & Accessing Compute**

- Logged into Pico Cloud (OpenStack dashboard).
- Navigated to **Compute → Instances**.
- Goal: Launch Ubuntu-based VMs for testing.

---

### **2. Network Configuration**

- **Network Name:** `net-1`
- **Subnet:** `192.168.10.0/24`
- **Gateway:** Enabled (default gateway becomes `192.168.10.1`)
- **DNS:** 8.8.8.8 (Google Public DNS)
- **DHCP Pool Range:** `192.168.10.2 - 192.168.10.254` (IPs available for VMs)

> 🔍 Purpose: To define an internal private network where all VMs can communicate.
> 

---

### **3. Router Configuration**

- **Router Name:** `router`
- **SNAT Enabled:** Yes ✅
- **External Network:** `public-fir-pool-01`

> 🔍 SNAT (Source NAT) enables internal VMs to reach the internet using the router’s public IP.
> 
- Added **internal interface** to `router` using `net-1`
    - Interface IP becomes `192.168.10.1`

> 🔍 This connects the private subnet to the router, so internal VMs can route via it.
> 

---

### **4. VM Creation**

Created two identical VMs:

- **Name:** `vm-1`, `vm-2`
- **Image:** Ubuntu 18.04
- **Specs:** 1 vCPU, 2GB RAM
- **Network:** `net-1`
- **Keypair:** Created to allow SSH access
- **Security Group:** `sec-1`
    - Allowed:
        - TCP 22 (SSH)
        - TCP 80 (HTTP)
        - TCP 443 (HTTPS)
        - ICMP (Ping)
        - All ingress (default)

> 🔍 Security group controls which ports are accessible from external/internal sources.
> 

---

### **5. Floating IP Allocation**

- **Allocated IP:** `160.191.150.136`
- Used later to map public access to the Load Balancer.

---

### **6. Load Balancer Setup (AmphoraV2)**

- **Type Chosen:** AmphoraV2 (supports both Layer 4 and 7)
- **Name:** `load-balancer-test`
- **Subnet:** `net-1`
- **Admin State:** Enabled

> 🔍 This is the core component that distributes traffic across VM instances.
> 

---

### **7. Listener Creation**

- Created **2 Listeners**:
    - `lis-ssh`: TCP on port 22
    - `lis-http`: HTTP on port 80

> 🔍 Listeners are the “entry points” to the load balancer for specific ports and protocols.
> 

---

### **8. Attach Floating IP**

- Attached `160.191.150.136` to the Load Balancer.

> 🔍 This allows external users to reach the load balancer using this public IP.
> 

---

### **9. Pool Configuration**

- Created **2 Pools**:
    - `pool-ssh`: Protocol TCP, Algorithm: Round Robin
    - `pool-http`: Protocol HTTP, Algorithm: Round Robin
    - Session Persistence: `None` (no sticky sessions)

> 🔍 Pools define how traffic is distributed and to which backend members.
> 

---

### **10. Pool Members (VMs)**

- Added `vm-1` and `vm-2` to both pools with their private IPs (`192.168.10.x`)
- These members now serve SSH and HTTP traffic depending on the listener.

---

### **11. Function Testing**

- **SSH Test:**
    - SSH into the floating IP multiple times.
    - First logged into `vm-2`, then `vm-1`, verifying **L4 load balancing**.
- **HTTP Test:**
    - Installed `nginx` on both VMs.
    - Custom HTML page: `"Hello from vm-1"` / `"Hello from vm-2"`
    - Opened the same IP in two tabs, got different responses → verified **L7 load balancing**
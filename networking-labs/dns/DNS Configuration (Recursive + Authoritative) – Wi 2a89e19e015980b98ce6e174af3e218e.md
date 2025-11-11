# DNS Configuration (Recursive + Authoritative) – Windows Server 2022 (with IIS)

## 🧩 Overview

A **DNS (Domain Name System)** server translates domain names into IP addresses, helping devices locate resources on a network or the internet.

This setup provides both:

- **Authoritative DNS** → Handles internal domain zones (e.g., `gelani.com`, `example.com`)
- **Recursive DNS** → Resolves external domains using forwarders (e.g., Google, Cloudflare)

**Environment:** Windows Server 2022

**Resources:** 2 vCPU cores, 4 GB RAM

**Use Case:** Small/medium environments or lab setup

---

## 🗂️ Final Topology Overview

```
[Windows Server 2022 VM]
       │
       ├─ Static IP Configuration
       │   ├─ IP: 192.168.42.1
       │   ├─ Subnet: 255.255.255.0 (/24)
       │   ├─ Gateway: 192.168.42.254
       │   ├─ DHCP: Disabled
       │   └─ Preferred DNS: 192.168.42.1
       │
       ├─ DNS Role Installed
       │
       ├─ Forward Lookup Zones
       │   ├─ gelani.com
       │   │   ├─ www → 192.168.42.11
       │   │   └─ emaduzzaman → 192.168.42.11
       │   └─ example.com
       │       └─ kazi → 192.168.42.11
       │
       ├─ Reverse Lookup Zone (42.168.192.in-addr.arpa)
       │   └─ PTR records auto-created
       │
       ├─ Forwarders
       │   ├─ 8.8.8.8 (Google)
       │   └─ 1.1.1.1 (Cloudflare)
       │
       ├─ Firewall Rules Enabled (TCP/UDP 53)
       │
       ├─ DNS Service Running
       │
       └─ nslookup Tests:
           ├─ Internal → www.gelani.com → 192.168.42.11
           └─ External → google.com → Resolved via Forwarders

```

---

## ⚙️ Prerequisites

- Static IP configured on server
- Administrator privileges
- Working network connection for testing

---

## 🌐 Step 1: Assign a Static IP

**Path:**

`Control Panel → Network Connections → Ethernet → Properties → IPv4 → Manual Configuration`

**Example Configuration:**

```
IP Address:      192.168.42.1
Subnet Mask:     255.255.255.0 (/24)
Default Gateway: 192.168.42.254
Preferred DNS:   192.168.42.1   (points to self)
DHCP:            Disabled

```

**PowerShell Verification:**

```powershell
ipconfig /all
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 192.168.42.1

```

---

## 🧰 Step 2: Install DNS Server Role

**Process:**

1. Open **Server Manager**
2. Click **Manage → Add Roles and Features**
3. Choose **Role-based or feature-based installation**
4. Select local server → **Next**
5. Select **DNS Server** → **Add Features** → **Next → Install**
6. Wait for installation → **Close**

> 💡 If prompted about static IP configuration, double-check the adapter settings.
> 

---

## 🧭 Step 3: Access DNS Manager

**Path:** `Server Manager → Tools → DNS`

---

## 📘 Step 4: Configure Forward Lookup Zones (Authoritative DNS)

### ➕ Create a New Zone

1. Right-click **Forward Lookup Zones → New Zone**
2. Select **Primary Zone → Next**
3. Enter **Zone Name:** `gelani.com`
4. Accept default file name → **Next**
5. Choose **Do not allow dynamic updates → Finish**

*(Repeat for other domains like `example.com` if needed)*

---

### 🌐 Add A Records (Host Records)

| Domain | Hostname | IP Address |
| --- | --- | --- |
| gelani.com | www | 192.168.42.11 |
| gelani.com | emaduzzaman | 192.168.42.11 |
| example.com | kazi | 192.168.42.11 |

**Steps:**

1. Expand your zone → Right-click → **New Host (A or AAAA)**
2. Enter `Name` and `IP Address`
3. ✅ Check **Create associated pointer (PTR) record**
4. Click **Add Host → OK**

---

## 🔁 Step 5: Create Reverse Lookup Zone (Optional but Recommended)

**Purpose:** Allows reverse DNS (IP → Hostname) lookup.

**Steps:**

1. Right-click **Reverse Lookup Zones → New Zone**
2. Select **Primary Zone → IPv4 → Next**
3. Enter **Network ID:** `192.168.42`
4. Finish setup

**Manual PTR Record (if needed):**

```
Reverse Zone: 42.168.192.in-addr.arpa
New Pointer → IP Suffix: 11 → Select host → OK

```

---

## 🌍 Step 6: Configure Forwarders (Recursive DNS)

**Purpose:** Allows resolving external (Internet) domains.

**Path:**

Right-click server name → **Properties → Forwarders → Edit**

**Add:**

```
8.8.8.8     (Google DNS)
1.1.1.1     (Cloudflare DNS)

```

✅ Apply → OK

**Test External Resolution:**

```powershell
nslookup google.com 192.168.42.1

```

---

## 🔒 Step 7: Configure Windows Firewall for DNS

### 🔎 Check DNS Firewall Rules

```powershell
Get-NetFirewallRule -DisplayName "*DNS Server*" | Format-Table DisplayName, Enabled, Direction, Action, Profile

```

### ✅ Enable DNS Rules

```powershell
Enable-NetFirewallRule -DisplayGroup "DNS Server"

```

### 🧱 Create Rules Manually (if missing)

```powershell
# UDP
New-NetFirewallRule -DisplayName "Allow DNS (UDP-In)" -Direction Inbound -Protocol UDP -LocalPort 53 -Action Allow -Profile Domain,Private

# TCP
New-NetFirewallRule -DisplayName "Allow DNS (TCP-In)" -Direction Inbound -Protocol TCP -LocalPort 53 -Action Allow -Profile Domain,Private

```

### 🔁 Restart DNS Service

```powershell
Restart-Service -Name DNS

```

---

## 🧪 Step 8: Testing & Verification

### 🔹 Internal (Authoritative DNS)

```powershell
nslookup www.gelani.com 192.168.42.1
nslookup emaduzzaman.gelani.com 192.168.42.1
nslookup kazi.example.com 192.168.42.1

```

**Expected Result:**

All return → `192.168.42.11`

---

### 🔹 External (Recursive DNS via Forwarders)

```powershell
nslookup google.com 192.168.42.1
nslookup cloudflare.com 192.168.42.1

```

**Expected Result:**

Resolves external IPs through forwarders.

---

## ✅ Step 9: Verification Checklist

| Checkpoint | Status |
| --- | --- |
| Static IP correctly configured (`ipconfig /all`) | ✅ |
| DNS service running (`Restart-Service -Name DNS`) | ✅ |
| Firewall allows TCP/UDP port 53 | ✅ |
| Forward lookup zones created & A records added | ✅ |
| Reverse lookup zone configured (optional) | ✅ |
| Forwarders set for internet access | ✅ |
| Internal and external DNS queries resolve correctly | ✅ |

---

---

## 🏁 Final Result Summary

| Type | Domain | Expected Output |
| --- | --- | --- |
| Authoritative | [www.gelani.com](http://www.gelani.com/) | 192.168.42.11 |
| Authoritative | emaduzzaman.gelani.com | 192.168.42.11 |
| Authoritative | kazi.example.com | 192.168.42.11 |
| Recursive | google.com | External IP (via forwarders) |
| Recursive | cloudflare.com | External IP (via forwarders) |

---

---

# Windows Server 2022 DNS Server Setup & Configuration 

---

## **1️⃣ Overview**

A DNS (Domain Name System) server translates human-friendly domain names into IP addresses, allowing devices to locate services within a network or on the internet.

* **Environment**: Windows Server 2022
* **Resources**: 2 vCPU cores, 4 GB RAM
* **Use Case**: Small to medium environments or lab setup
* **Prerequisites**:

  * Static IP configured on server
  * Administrator privileges
  * Network connectivity for testing

---

## **2️⃣ Assign a Static IP**

1. Go to **Network Connections** → select your active adapter → **Properties** → IPv4 → **Manual configuration**.
2. Example:

   * IP Address: `192.168.42.1`
   * Subnet Mask: `255.255.255.0` (/24)
   * Default Gateway: `192.168.42.254` (if required)
3. Disable DHCP for this adapter.

**Verify configuration**:

```powershell
ipconfig /all
```

* `IPv4 Address`: 192.168.42.1
* `DHCP Enabled`: No

**Important**: DNS server’s preferred DNS should point to itself:

```powershell
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 192.168.42.1
```

---

## **3️⃣ Install DNS Server Role**

1. Open **Server Manager → Manage → Add Roles and Features**
2. Role-based or feature-based installation → select local server → Next
3. Select **DNS Server** → Click **Add Features** → Next → Install
4. Wait for installation → **Close**

✅ **Tip**: If wizard warns about static IP, check your adapter and DNS configuration.

---

## **4️⃣ Access DNS Manager**

* Server Manager → **Tools → DNS**

---

## **5️⃣ Create Forward Lookup Zones**

**Purpose**: Maps domain names to IP addresses.

### **Step 1 – Create Zone**

1. Right-click **Forward Lookup Zones → New Zone**
2. Select **Primary Zone → Next**
3. Zone name: `yourdomain.local` (e.g., `company.local`)
4. Accept default file name → Next
5. Select **Do not allow dynamic updates → Finish**

### **Step 2 – Add A Record (Host Record)**

1. Expand your zone → Right-click → **New Host (A or AAAA)**
2. Example:

   * Name: `www`
   * IP Address: `192.168.42.10`
   * Check **Create associated pointer (PTR) record)**
3. Click **Add Host → OK**

---

## **6️⃣ Create Reverse Lookup Zone (Optional but Recommended)**

**Purpose**: Resolves IP → Domain names (useful for troubleshooting)

1. Right-click **Reverse Lookup Zones → New Zone**
2. Primary Zone → IPv4 → Enter Network ID (e.g., `192.168.42`) → Finish
3. PTR records auto-created if “Create associated pointer record” is checked

**Manual PTR**:

```plaintext
Reverse Lookup Zone → 42.168.192 → New Pointer → IP suffix: 10 → Select host → OK
```

---

## **7️⃣ Configure Forwarders**

**Purpose**: Resolve external domains (e.g., google.com)

1. Right-click server name → **Properties → Forwarders → Edit**
2. Add:

   * `8.8.8.8` (Google)
   * `1.1.1.1` (Cloudflare)
3. Apply → OK

**Test external resolution**:

```cmd
nslookup google.com 192.168.42.1
```

---

## **8️⃣ Configure Firewall for DNS**

### **Step 1 – Check DNS inbound rules**

```powershell
Get-NetFirewallRule -DisplayName "*DNS Server*" | Format-Table DisplayName, Enabled, Direction, Action, Profile
```

### **Step 2 – Enable rules**

```powershell
Enable-NetFirewallRule -DisplayGroup "DNS Server"
```

### **Step 3 – Create manually (if missing)**

```powershell
# UDP
New-NetFirewallRule -DisplayName "Allow DNS (UDP-In)" -Direction Inbound -Protocol UDP -LocalPort 53 -Action Allow -Profile Domain,Private

# TCP
New-NetFirewallRule -DisplayName "Allow DNS (TCP-In)" -Direction Inbound -Protocol TCP -LocalPort 53 -Action Allow -Profile Domain,Private
```

### **Step 4 – Restart DNS service**

```powershell
Restart-Service -Name DNS
```

---

## **9️⃣ Create Multiple Domains & Host Records (Example Setup)**

### **Domains & IPs**

| Domain           | Hostname | IP Address    |
| ---------------- | -------- | ------------- |
| lplmis.com       | www      | 192.168.42.11 |
| lplmis.com       | intranet | 192.168.42.11 |
| labaidpharma.com | order    | 192.168.42.11 |

### **Step 1 – Forward Lookup Zone**

* Create `lplmis.com` & `labaidpharma.com`
* Add A records for each hostname
* Enable PTR if reverse zone exists

### **Step 2 – Test DNS**

```cmd
nslookup www.lplmis.com 192.168.42.1
nslookup intranet.lplmis.com 192.168.42.1
nslookup order.labaidpharma.com 192.168.42.1
```

✅ Should return: `192.168.42.11`

> Note: These mappings only work internally. External users require public DNS configuration.

---

## **🔟 Verification Checklist**

* Static IP correctly applied (`ipconfig /all`)
* DNS service running (`Restart-Service -Name DNS`)
* Firewall rules allowing TCP/UDP 53 inbound
* Forward lookup zones exist & records added
* Reverse lookup zones exist (optional)
* Forwarders configured for internet access
* Test internal & external resolutions using `nslookup`



# DNS Configuration (Recursive + Authoritative) Windows Server 2022–with IIS

---

## **Architecture Diagram**

[Windows Server 2022 VM]
       │
       │ Configure Static IP
       │ ├─ IP: 192.168.42.1
       │ ├─ Subnet: 255.255.255.0 (/24)
       │ ├─ Gateway: 192.168.42.254
       │ ├─ DHCP: Disabled
       │ └─ Preferred DNS: 192.168.42.1 (self)
       │
       │ PowerShell Verification:
       │ ipconfig /all
       │ Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 192.168.42.1
       ▼
[Install DNS Server Role]
       │
       │ Server Manager → Manage → Add Roles and Features
       │ Role-based installation → Select local server → DNS Server → Add Features → Install
       ▼
[Access DNS Manager]
       │
       │ Server Manager → Tools → DNS
       ▼
[Forward Lookup Zones]
       │
       ├─ Zone: gelani.com
       │      ├─ A Record: www → 192.168.42.11
       │      │   PTR auto-created if reverse zone exists
       │      └─ A Record: emaduzzaman → 192.168.42.11
       │
       └─ Zone: example.com
              └─ A Record: kazi → 192.168.42.11
              
[Reverse Lookup Zone (Optional)]
       │
       └─ Zone: 42.168.192.in-addr.arpa
              └─ PTR Records auto-created from A Records
       │
       │ Manual PTR (if needed):
       │ Right-click → New Pointer → IP suffix → Select Host → OK
       ▼
[Configure Forwarders]
       │
       │ Purpose: External DNS resolution
       │ Server Properties → Forwarders → Edit
       │ ├─ 8.8.8.8 (Google)
       │ └─ 1.1.1.1 (Cloudflare)
       ▼
[Firewall Configuration – PowerShell]
       │
       │ Check existing DNS rules:
       │ Get-NetFirewallRule -DisplayName "*DNS Server*" | ft DisplayName, Enabled, Direction, Action, Profile
       │
       │ Enable built-in rules:
       │ Enable-NetFirewallRule -DisplayGroup "DNS Server"
       │
       │ Create manually if missing:
       │ New-NetFirewallRule -DisplayName "Allow DNS (UDP-In)" -Direction Inbound -Protocol UDP -LocalPort 53 -Action Allow -Profile Domain,Private
       │ New-NetFirewallRule -DisplayName "Allow DNS (TCP-In)" -Direction Inbound -Protocol TCP -LocalPort 53 -Action Allow -Profile Domain,Private
       │
       │ Restart DNS service:
       │ Restart-Service -Name DNS
       ▼
[Test & Verification – Command Line]
       │
       │ Internal Names:
       │ nslookup www.gelani.com 192.168.42.1
       │ nslookup emaduzzaman.gelani.com 192.168.42.1
       │ nslookup kazi.example.com 192.168.42.1
       │
       │ External Forwarders:
       │ nslookup google.com 192.168.42.1
       ▼
[ Result]
       │
       ├─ www.gelani.com → 192.168.42.11
       ├─ emaduzzaman.gelani.com → 192.168.42.11
       ├─ kazi.example.com → 192.168.42.11
       └─ External sites resolvable via forwarders

---

## **Overview**

A DNS (Domain Name System) server translates human-friendly domain names into IP addresses, allowing devices to locate services within a network or on the internet.

**This DNS server is configured to work as:**

* **Authoritative**: Serves internal domain zones you create (e.g., `gelani.com`, `example.com`)  
* **Recursive**: Resolves external domains using forwarders (e.g., Google, Cloudflare)

* **Environment**: Windows Server 2022  
* **Resources**: 2 vCPU cores, 4 GB RAM  
* **Use Case**: Small to medium environments or lab setup  
* **Prerequisites**:  

  * Static IP configured on server  
  * Administrator privileges  
  * Network connectivity for testing  

---

## **Assign a Static IP**

1. Go to **Network Connections → select your active adapter → Properties → IPv4 → Manual configuration**  
2. Example:

   * IP Address: `192.168.42.1`  
   * Subnet Mask: `255.255.255.0` (/24)  
   * Default Gateway: `192.168.42.254` (if required)  
3. Disable DHCP for this adapter.

**Verify configuration**:

```powershell
ipconfig /all
````

* `IPv4 Address`: 192.168.42.1
* `DHCP Enabled`: No

**Important**: DNS server’s preferred DNS should point to itself:

```powershell
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 192.168.42.1
```

---

## **Install DNS Server Role**

1. Open **Server Manager → Manage → Add Roles and Features**
2. Role-based or feature-based installation → select local server → Next
3. Select **DNS Server → Add Features → Next → Install**
4. Wait for installation → **Close**

 **Tip**: If wizard warns about static IP, check your adapter and DNS configuration.

---

## **Access DNS Manager**

* Server Manager → **Tools → DNS**

---

## **Create Forward Lookup Zones (Authoritative Part)**

**Purpose**: Maps internal domain names to IP addresses. This is the **authoritative part** of the DNS server.

### **Step 1 – Create Zone**

1. Right-click **Forward Lookup Zones → New Zone**
2. Select **Primary Zone → Next**
3. Zone name: `gelani.com` (or `example.com`)
4. Accept default file name → Next
5. Select **Do not allow dynamic updates → Finish**

### **Step 2 – Add A Record (Host Record)**

1. Expand your zone → Right-click → **New Host (A or AAAA)**
2. Example:

   * Name: `www`
   * IP Address: `192.168.42.11`
   * Check **Create associated pointer (PTR) record)**
3. Click **Add Host → OK**

**Other example host records:**

| Domain      | Hostname    | IP Address    |
| ----------- | ----------- | ------------- |
| gelani.com  | www         | 192.168.42.11 |
| gelani.com  | emaduzzaman | 192.168.42.11 |
| example.com | kazi        | 192.168.42.11 |

---

## **Create Reverse Lookup Zone (Optional but Recommended)**

**Purpose**: Resolves IP → Domain names (helpful for troubleshooting).

1. Right-click **Reverse Lookup Zones → New Zone**
2. Primary Zone → IPv4 → Enter Network ID (e.g., `192.168.42`) → Finish
3. PTR records auto-created if “Create associated pointer record” is checked

**Manual PTR**:

```plaintext
Reverse Lookup Zone → 42.168.192 → New Pointer → IP suffix: 11 → Select host → OK
```

---

## **Configure Forwarders (Recursive Part)**

**Purpose**: Resolve external domains (e.g., google.com). This is the **recursive part** of the DNS server.

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

## **Configure Firewall for DNS**

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

## **Test & Verification**

### **Authoritative DNS (Internal Domains)**

```cmd
nslookup www.gelani.com 192.168.42.1
nslookup emaduzzaman.gelani.com 192.168.42.1
nslookup kazi.example.com 192.168.42.1
```

Should return: `192.168.42.11`

### **Recursive DNS (External Domains)**

```cmd
nslookup google.com 192.168.42.1
nslookup cloudflare.com 192.168.42.1
```

Should return external IPs resolved via forwarders

---

## **Verification Checklist**

* Static IP correctly applied (`ipconfig /all`)
* DNS service running (`Restart-Service -Name DNS`)
* Firewall rules allowing TCP/UDP 53 inbound
* Forward lookup zones exist & records added (**authoritative**)
* Reverse lookup zones exist (optional)
* Forwarders configured for internet access (**recursive**)
* Test internal & external resolutions using `nslookup`

---





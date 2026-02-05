# DNS Configuration (Recursive + Authoritative) Windows Server 2022–with IIS


### DNS Server Capabilities

This DNS server is configured to work as:

- **Authoritative**: Serves internal domain zones you create (e.g., `gelani.com`, `example.com`)
- **Recursive**: Resolves external domains using forwarders (e.g., Google, Cloudflare)

### Environment Specifications

- **Operating System**: Windows Server 2022
- **Resources**: 2 vCPU cores, 4 GB RAM
- **Use Case**: Small to medium environments or lab setup

### Prerequisites

- Static IP configured on server
- Administrator privileges
- Network connectivity for testing
- Basic understanding of DNS concepts

---

## Architecture Diagram

```
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
[Result]
       │
       ├─ www.gelani.com → 192.168.42.11
       ├─ emaduzzaman.gelani.com → 192.168.42.11
       ├─ kazi.example.com → 192.168.42.11
       └─ External sites resolvable via forwarders
```

---

## Network Configuration

### Assign a Static IP

1. Go to **Network Connections → select your active adapter → Properties → IPv4 → Manual configuration**
2. Example configuration:
   - IP Address: `192.168.42.1`
   - Subnet Mask: `255.255.255.0` (/24)
   - Default Gateway: `192.168.42.254` (if required)
3. Disable DHCP for this adapter.

### Verify Configuration

```powershell
ipconfig /all
```

Expected output:
- `IPv4 Address`: 192.168.42.1
- `DHCP Enabled`: No

### Configure DNS Server Address

**Important**: DNS server's preferred DNS should point to itself:

```powershell
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 192.168.42.1
```

---

## DNS Server Installation

### Install DNS Server Role

1. Open **Server Manager → Manage → Add Roles and Features**
2. Select **Role-based or feature-based installation → Next**
3. Select **local server → Next**
4. Select **DNS Server → Add Features → Next → Install**
5. Wait for installation to complete → **Close**

**Tip**: If wizard warns about static IP, check your adapter and DNS configuration.

---

## Access DNS Manager

To access the DNS Manager:

- Open **Server Manager → Tools → DNS**

---

## Forward Lookup Zones Configuration

**Purpose**: Maps internal domain names to IP addresses. This is the **authoritative part** of the DNS server.

### Create Forward Lookup Zone

1. Right-click **Forward Lookup Zones → New Zone**
2. Select **Primary Zone → Next**
3. Enter Zone name: `gelani.com` (or `example.com`)
4. Accept default file name → Next
5. Select **Do not allow dynamic updates → Finish**

### Add A Records (Host Records)

1. Expand your zone → Right-click → **New Host (A or AAAA)**
2. Example configuration:
   - Name: `www`
   - IP Address: `192.168.42.11`
   - Check **Create associated pointer (PTR) record**
3. Click **Add Host → OK**

### DNS Records Configuration

| Domain      | Hostname    | IP Address    |
|-------------|-------------|---------------|
| gelani.com  | www         | 192.168.42.11 |
| gelani.com  | emaduzzaman | 192.168.42.11 |
| example.com | kazi        | 192.168.42.11 |

---

## Reverse Lookup Zones Configuration

**Purpose**: Resolves IP addresses to domain names (helpful for troubleshooting).

### Create Reverse Lookup Zone

1. Right-click **Reverse Lookup Zones → New Zone**
2. Select **Primary Zone → Next**
3. Select **IPv4 Reverse Lookup Zone → Next**
4. Enter Network ID: `192.168.42` → Next
5. Accept default file name → Next
6. Select **Do not allow dynamic updates → Finish**

### PTR Records

PTR records are auto-created if "Create associated pointer record" is checked when creating A records.

**Manual PTR Creation**:

```plaintext
Reverse Lookup Zone → 42.168.192 → Right-click → New Pointer → IP suffix: 11 → Select host → OK
```

---

## Forwarders Configuration

**Purpose**: Resolve external domains (e.g., google.com). This is the **recursive part** of the DNS server.

### Configure Forwarders

1. Right-click server name in DNS Manager → **Properties → Forwarders → Edit**
2. Add the following DNS servers:
   - `8.8.8.8` (Google DNS)
   - `1.1.1.1` (Cloudflare DNS)
3. Click **OK → Apply → OK**

### Test External Resolution

```cmd
nslookup google.com 192.168.42.1
```

---

## Firewall Configuration

### Check Existing DNS Rules

```powershell
Get-NetFirewallRule -DisplayName "*DNS Server*" | Format-Table DisplayName, Enabled, Direction, Action, Profile
```

### Enable Built-in DNS Rules

```powershell
Enable-NetFirewallRule -DisplayGroup "DNS Server"
```

### Create Manual Rules (if missing)

**Allow DNS over UDP**:

```powershell
New-NetFirewallRule -DisplayName "Allow DNS (UDP-In)" -Direction Inbound -Protocol UDP -LocalPort 53 -Action Allow -Profile Domain,Private
```

**Allow DNS over TCP**:

```powershell
New-NetFirewallRule -DisplayName "Allow DNS (TCP-In)" -Direction Inbound -Protocol TCP -LocalPort 53 -Action Allow -Profile Domain,Private
```

### Restart DNS Service

```powershell
Restart-Service -Name DNS
```

---

## Testing and Verification

### Test Authoritative DNS (Internal Domains)

```cmd
nslookup www.gelani.com 192.168.42.1
nslookup emaduzzaman.gelani.com 192.168.42.1
nslookup kazi.example.com 192.168.42.1
```

**Expected Result**: All queries should return `192.168.42.11`

### Test Recursive DNS (External Domains)

```cmd
nslookup google.com 192.168.42.1
nslookup cloudflare.com 192.168.42.1
```

**Expected Result**: Should return external IPs resolved via forwarders
---

## Troubleshooting

### Common Issues and Solutions

#### DNS Service Not Starting

**Check service status**:

```powershell
Get-Service -Name DNS
```

**Start DNS service**:

```powershell
Start-Service -Name DNS
```

#### DNS Queries Not Resolving

**Verify DNS server is listening on port 53**:

```powershell
Test-NetConnection -ComputerName 192.168.42.1 -Port 53
```

**Check DNS event logs**:

```powershell
Get-EventLog -LogName "DNS Server" -Newest 50
```

#### Firewall Blocking DNS Traffic

**Verify firewall rules**:

```powershell
Get-NetFirewallRule -DisplayGroup "DNS Server" | Format-Table DisplayName, Enabled, Action
```

**Temporarily disable firewall for testing**:

```powershell
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
```

**Remember to re-enable firewall after testing**:

```powershell
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
```

#### Clear DNS Cache

**On DNS Server**:

```powershell
Clear-DnsServerCache
```

**On Client Machine**:

```cmd
ipconfig /flushdns
```

---

## Summary

This project successfully implements a fully functional DNS server on Windows Server 2022 with the following capabilities:

### Key Features Implemented

1. **Authoritative DNS Server**
   - Forward lookup zones for internal domains (gelani.com, example.com)
   - A records mapping hostnames to IP addresses
   - Reverse lookup zones for PTR records

2. **Recursive DNS Server**
   - Forwarders configured for external domain resolution
   - Integration with public DNS servers (Google, Cloudflare)

3. **Network Configuration**
   - Static IP assignment
   - Proper DNS self-referencing
   - Firewall rules for DNS traffic

4. **Testing and Validation**
   - Internal domain resolution verified
   - External domain resolution confirmed
   - Both UDP and TCP DNS traffic allowed

### DNS Records Summary

| Record Type | Domain                    | Resolution        |
|-------------|---------------------------|-------------------|
| A Record    | www.gelani.com            | 192.168.42.11     |
| A Record    | emaduzzaman.gelani.com    | 192.168.42.11     |
| A Record    | kazi.example.com          | 192.168.42.11     |
| PTR Record  | 192.168.42.11             | Reverse resolution|
| Forwarder   | External domains          | 8.8.8.8, 1.1.1.1  |
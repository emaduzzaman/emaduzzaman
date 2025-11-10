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
       ├─ Zone: lplmis.com
       │      ├─ A Record: www → 192.168.42.11
       │      │   PTR auto-created if reverse zone exists
       │      └─ A Record: intranet → 192.168.42.11
       │
       └─ Zone: labaidpharma.com
              └─ A Record: order → 192.168.42.11
              
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
       │ nslookup www.lplmis.com 192.168.42.1
       │ nslookup intranet.lplmis.com 192.168.42.1
       │ nslookup order.labaidpharma.com 192.168.42.1
       │
       │ External Forwarders:
       │ nslookup google.com 192.168.42.1
       ▼
[✅ Result]
       │
       ├─ www.lplmis.com → 192.168.42.11
       ├─ intranet.lplmis.com → 192.168.42.11
       ├─ order.labaidpharma.com → 192.168.42.11
       └─ External sites resolvable via forwarders

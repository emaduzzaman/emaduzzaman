# Network Diagnostics 101

Bash scripts for diagnosing and troubleshooting network issues on Ubuntu/Linux systems.

---

## Scripts

| Script | Description |
|--------|-------------|
| `network_diagnose.sh` | Basic network diagnostic tool |
| `network_diagnose-version-2.sh` | Advanced diagnostic tool with extended features |

---

## Usage

```bash
# Make executable
chmod +x network_diagnose.sh network_diagnose-version-2.sh

# Run basic diagnostics
sudo bash network_diagnose.sh

# Run advanced diagnostics
sudo bash network_diagnose-version-2.sh

# Advanced: Save results to file
sudo bash network_diagnose-version-2.sh --save

# Advanced: Quick mode (skip slow tests)
sudo bash network_diagnose-version-2.sh --quick
```

---

## Description 

### network_diagnose.sh (Basic)

| Check | Info Provided |
|-------|---------------|
| IP & Interfaces | `ip addr show`, `ip link show` |
| Routing | Routing table, default gateway |
| DNS | `/etc/resolv.conf` contents |
| Gateway Ping | Tests local network connectivity |
| External Ping | Tests internet via 8.8.8.8 |
| DNS Resolution | Tests if google.com resolves |
| Listening Ports | Active TCP/UDP ports |
| System Info | Uptime and current date |

### network_diagnose-version-2.sh (Advanced)

Everything in basic, plus:

| Check | Info Provided |
|-------|---------------|
| Interface Statistics | RX/TX bytes, errors, dropped packets |
| DNS Response Time | Measures DNS server latency (ms) |
| Packet Loss Analysis | Detects network reliability issues |
| Firewall Status | UFW and iptables rules |
| Traceroute | Network path to external hosts |
| Netplan Config | Shows current network configuration |
| Cloud-Init Status | Checks if cloud-init manages network |
| Summary Report | Pass/fail overview with troubleshooting tips |

---

## Requirements

- **OS:** Ubuntu / Debian / Linux with systemd
- **Privileges:** Root (sudo)
- **Optional packages:** `traceroute`, `dnsutils`, `mtr-tiny`

```bash
# Install optional tools for full diagnostics
sudo apt install traceroute dnsutils mtr-tiny -y
```

---

## Example Output (Version 2)

```
DIAGNOSTIC SUMMARY

Test Results:
─────────────────────────────────────────
✓ Gateway connectivity:     OK
✓ Internet connectivity:    OK
✓ DNS resolution:           OK
✓ Interface errors:         NONE

Overall Status:
All network tests passed! ✓
```

---

## When to Use

| Situation | Recommended Script |
|-----------|-------------------|
| Quick connectivity check | `network_diagnose.sh` |
| Detailed troubleshooting | `network_diagnose-version-2.sh` |
| Saving results for support | `network_diagnose-version-2.sh --save` |
| Slow connection / SSH session | `network_diagnose-version-2.sh --quick` |

---

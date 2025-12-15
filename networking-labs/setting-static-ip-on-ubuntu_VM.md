# Setting Static IP on Ubuntu VM in OpenStack Pico Public Cloud
## Table of Contents
- [Quick Commands](#quick-commands)
- [Detailed Step-by-Step Guide](#detailed-step-by-step-guide)
- [Verification](#verification)
- [Troubleshooting](#troubleshooting)

## Quick Commands

Use this section for rapid static IP configuration. Replace the values with your own network details.

```bash
# 1. Disable cloud-init network management
sudo bash -c 'echo "network: {config: disabled}" > /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg'

# 2. Get your MAC address (note the value for ens3)
ip link show ens3

# 3. Create new Netplan configuration (edit values before running)
sudo tee /etc/netplan/01-netcfg.yaml > /dev/null <<EOF
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      addresses: [192.168.90.28/27]
      routes:
        - to: default
          via: 192.168.90.1
      nameservers:
        addresses: [127.0.0.1, 8.8.8.8]
      match:
        macaddress: fa:16:3e:8b:65:64
      mtu: 8942
EOF

# 4. Secure the configuration file
sudo chmod 600 /etc/netplan/01-netcfg.yaml

# 5. Remove old cloud-init configuration
sudo rm -f /etc/netplan/50-cloud-init.yaml

# 6. Disable systemd-networkd-wait-online (optional, speeds up boot)
sudo systemctl disable systemd-networkd-wait-online

# 7. Apply configuration
sudo netplan apply

# 8. Verify connectivity
ping -c 3 8.8.8.8
```

### Quick Configuration Template

Copy and edit this template with your network details:

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      addresses: [YOUR_IP/SUBNET]        # Example: 192.168.90.28/27
      routes:
        - to: default
          via: YOUR_GATEWAY              # Example: 192.168.90.1
      nameservers:
        addresses: [DNS1, DNS2]          # Example: [127.0.0.1, 8.8.8.8]
      match:
        macaddress: YOUR_MAC_ADDRESS     # Example: fa:16:3e:8b:65:64
      mtu: 8942
```

---

## Detailed Step-by-Step Guide

### Step 1: Check Existing Network Configuration

Navigate to the Netplan directory and examine the current configuration:

```bash
cd /etc/netplan
ls -la
```

Expected output:
```
50-cloud-init.yaml
```

View the current cloud-init configuration:

```bash
cat 50-cloud-init.yaml
```

Typical content:
```yaml
network:
    version: 2
    ethernets:
        ens3:
            dhcp4: true
            match:
                macaddress: fa:16:3e:8b:65:64
            mtu: 8942
            set-name: ens3
```

### Step 2: Gather Network Information

Check your current network configuration:

```bash
ip a
```

Example output:
```
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8942 qdisc fq_codel state UP group default qlen 1000
    link/ether fa:16:3e:8b:65:64 brd ff:ff:ff:ff:ff:ff
    inet 192.168.90.28/27 metric 100 brd 192.168.90.31 scope global dynamic ens3
```

Note the following:
- **Interface name**: `ens3`
- **MAC address**: `fa:16:3e:8b:65:64`
- **Current IP**: `192.168.90.28/27`
- **MTU**: `8942`

### Step 3: Disable Cloud-Init Network Configuration

Create a configuration file to prevent cloud-init from managing network settings:

```bash
sudo nano /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
```

Add this line:
```yaml
network: {config: disabled}
```

Save and exit (`Ctrl+X`, then `Y`, then `Enter`).

Verify the file:
```bash
cat /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
```

### Step 4: Create Static IP Configuration

Create a new Netplan configuration file:

```bash
sudo nano /etc/netplan/01-netcfg.yaml
```

Add your static IP configuration:

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      addresses: [192.168.90.28/27]
      routes:
        - to: default
          via: 192.168.90.1
      nameservers:
        addresses: [127.0.0.1, 8.8.8.8]
      match:
        macaddress: fa:16:3e:8b:65:64
      mtu: 8942
```

**Configuration Breakdown:**
- `addresses`: Your static IP with subnet in CIDR notation
- `routes`: Default gateway configuration
- `via`: Gateway IP address
- `nameservers`: DNS servers (local and public)
- `macaddress`: Ensures configuration applies to correct interface
- `mtu`: Maximum Transmission Unit (preserve from original config)

Save and exit.

Verify the configuration:
```bash
cat /etc/netplan/01-netcfg.yaml
```

### Step 5: Secure the Configuration File

Set appropriate permissions:

```bash
sudo chmod 600 /etc/netplan/01-netcfg.yaml
```

### Step 6: Remove Old Cloud-Init Configuration

Delete the old DHCP configuration:

```bash
sudo rm /etc/netplan/50-cloud-init.yaml
```

Verify removal:
```bash
ls /etc/netplan/
```

Expected output:
```
01-netcfg.yaml
```

### Step 7: Disable systemd-networkd-wait-online (Optional)

This service can slow down boot times. Disable it:

```bash
sudo systemctl disable systemd-networkd-wait-online
```

Expected output:
```
Removed /etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service.
```

### Step 8: Apply the Configuration

Apply the new network configuration:

```bash
sudo netplan apply
```

**Note:** You may see this warning, which can be safely ignored if you're not using Open vSwitch:
```
WARNING:root:Cannot call Open vSwitch: ovsdb-server.service is not running.
```

---

## Verification

### Test Internal Network Connectivity

Ping your gateway:

```bash
ping -c 3 192.168.90.1
```

Expected output:
```
64 bytes from 192.168.90.1: icmp_seq=1 ttl=254 time=2.28 ms
64 bytes from 192.168.90.1: icmp_seq=2 ttl=254 time=0.621 ms
64 bytes from 192.168.90.1: icmp_seq=3 ttl=254 time=0.543 ms
```

### Test External Network Connectivity

Ping a public DNS server:

```bash
ping -c 3 8.8.8.8
```

Expected output:
```
64 bytes from 8.8.8.8: icmp_seq=1 ttl=117 time=27.1 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=117 time=25.3 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=117 time=26.5 ms
```

### Test DNS Resolution

```bash
ping -c 3 google.com
```

### Verify IP Configuration

```bash
ip addr show ens3
```

Confirm that your static IP is configured:
```
inet 192.168.90.28/27 brd 192.168.90.31 scope global ens3
```

### Check Routing Table

```bash
ip route
```

Expected output should show your default route:
```
default via 192.168.90.1 dev ens3
192.168.90.0/27 dev ens3 proto kernel scope link src 192.168.90.28
```

---

## Troubleshooting

### Network Configuration Not Applied

If the configuration doesn't apply, try:

```bash
# Check for syntax errors
sudo netplan --debug apply

# Generate and apply configuration
sudo netplan generate
sudo netplan apply
```

### Lost Network Connection After Apply

If you lose connectivity after applying:

1. Access the VM console through OpenStack dashboard
2. Check the configuration syntax
3. Verify the IP, gateway, and subnet are correct
4. Restart networking:

```bash
sudo systemctl restart systemd-networkd
```

### Check Netplan Status

```bash
sudo netplan status
```

### View Network Service Logs

```bash
sudo journalctl -u systemd-networkd -n 50
```

### Revert to DHCP

If you need to revert to DHCP:

```bash
sudo rm /etc/netplan/01-netcfg.yaml
sudo rm /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg

# Recreate cloud-init config
sudo tee /etc/netplan/50-cloud-init.yaml > /dev/null <<EOF
network:
    version: 2
    ethernets:
        ens3:
            dhcp4: true
            match:
                macaddress: fa:16:3e:8b:65:64
            mtu: 8942
            set-name: ens3
EOF

sudo netplan apply
```

### Common Issues

**Issue: Wrong gateway or subnet**
- Verify your network details with OpenStack dashboard
- Check the subnet CIDR notation matches your network

**Issue: DNS not resolving**
- Test with `nslookup google.com`
- Try alternative DNS servers: `1.1.1.1`, `8.8.4.4`

**Issue: MTU problems**
- OpenStack Pico typically uses MTU 8942 (jumbo frames)
- Keep this value from your original configuration

---

## Additional Notes

- **Persistence**: This configuration persists across reboots
- **Cloud-init**: Disabled to prevent automatic reconfiguration
- **MAC address matching**: Ensures configuration applies to correct interface
- **Multiple interfaces**: Repeat the process for each interface with unique configurations
- **Security groups**: Ensure OpenStack security groups allow your traffic
- **Floating IPs**: This guide is for private IPs; floating IPs are managed in OpenStack

---

## Network Configuration Examples

### Example 1: /24 Subnet
```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      addresses: [10.0.0.50/24]
      routes:
        - to: default
          via: 10.0.0.1
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1]
      match:
        macaddress: fa:16:3e:xx:xx:xx
      mtu: 8942
```

### Example 2: Multiple DNS Servers
```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      addresses: [192.168.1.100/24]
      routes:
        - to: default
          via: 192.168.1.1
      nameservers:
        addresses: [1.1.1.1, 1.0.0.1, 8.8.8.8, 8.8.4.4]
      match:
        macaddress: fa:16:3e:xx:xx:xx
      mtu: 8942
```

### Example 3: Custom MTU
```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      addresses: [172.16.0.10/16]
      routes:
        - to: default
          via: 172.16.0.1
      nameservers:
        addresses: [8.8.8.8]
      match:
        macaddress: fa:16:3e:xx:xx:xx
      mtu: 1500
```
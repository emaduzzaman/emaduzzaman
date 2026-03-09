# Static IP Configuration on Ubuntu (PICO - OpenStack VM)

Configuring a static IP address on an Ubuntu 22.04 VM running on OpenStack (PICO Public Cloud), replacing the default DHCP configuration with Netplan.

## Overview

This guide documents the process of converting a DHCP-assigned IP to a static IP configuration on an Ubuntu server (hostname: `gelani`) using Netplan.

## Configuration Details

| Setting | Value |
|---------|-------|
| Interface | ens3 |
| IP Address | 192.168.95.215/24 |
| Gateway | 192.168.95.1 |
| DNS | 8.8.8.8 |
| MTU | 8942 |

## Steps Performed

1. Disabled cloud-init network configuration by creating `/etc/cloud/cloud.cfg.d/99-disable-network-config.cfg`
2. Modified `/etc/netplan/50-cloud-init.yaml` to use static IP instead of DHCP
3. Applied the configuration with `netplan apply`

## Files

- [terminal-log.md](terminal-log.md) — Full terminal session log

## Notes

- The Open vSwitch warning can be ignored if you're not using OVS
- Make sure to disable cloud-init network config first, otherwise changes won't persist after reboot

## Environment

- **OS:** Ubuntu 22.04
- **Platform:** OpenStack
- **Network Driver:** virtio_net

#!/bin/bash
# =========================================
# WireGuard + NAT + Forwarding Setup Script
# =========================================

# WireGuard Allowed IPs
# Multi-network routes for the VPN client
ALLOWED_IPS="10.0.0.0/24, 192.168.95.0/24, 192.168.110.0/24, 172.30.30.0/24, 172.30.31.0/24"
echo "AllowedIPs = $ALLOWED_IPS"

# Check if IP forwarding is enabled
echo "Checking IP forwarding..."
sysctl net.ipv4.ip_forward

# NAT (MASQUERADE) rules for traffic from wg0 to internal networks
sudo iptables -t nat -A POSTROUTING -o ens3 -s 10.0.0.0/24 -d 172.30.30.0/24 -j MASQUERADE
sudo iptables -t nat -A POSTROUTING -o ens3 -s 10.0.0.0/24 -d 172.30.31.0/24 -j MASQUERADE

# List current NAT POSTROUTING rules
sudo iptables -t nat -L POSTROUTING -v -n

# Forwarding rules between wg0 and ens3
sudo iptables -I FORWARD -i wg0 -o ens3 -s 10.0.0.0/24 -d 172.30.30.0/24 -j ACCEPT
sudo iptables -I FORWARD -i ens3 -o wg0 -s 172.30.30.0/24 -d 10.0.0.0/24 -j ACCEPT

sudo iptables -I FORWARD -i wg0 -o ens3 -s 10.0.0.0/24 -d 172.30.31.0/24 -j ACCEPT
sudo iptables -I FORWARD -i ens3 -o wg0 -s 172.30.31.0/24 -d 10.0.0.0/24 -j ACCEPT

# List current FORWARD rules
sudo iptables -L FORWARD -v -n

# Restart WireGuard interface
sudo wg-quick down wg0
sudo wg-quick up wg0

echo "Setup complete!"
